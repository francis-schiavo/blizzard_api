# frozen_string_literal: true

##
# @!macro [new] init_options
#   @param [Hash] options
#   @option options [String] :region API Region
#   @option options [Symbol] :mode API Mode

##
# @!macro [new] request_options
#   @param {Hash} options You can specify some options
#   @option options [String] :locale Overrides the default locale for a single call
#   @option options [String] :namespace Overrides the default namespace for a single call
#   @option options [String] :access_token Overrides the access_token for a single call
#   @option options [Boolean] :ignore_cache If set to true the request will not use the cache
#   @option options [Integer] :ttl Override the default time (in seconds) a request should be cached
#   @option options [DateTime] :since Adds the If-modified-since headers. Will always ignore cache when set.

##
# @!macro [new] response
#   @return [Hash] API Response. The actual type of the returned object depends on the *format* option
#   in the configuration module

module BlizzardApi
  ##
  # Simplifies the requests to Blizzard APIS
  class Request
    include ApiStandards

    # One hour cache
    CACHE_HOUR = 3600
    # One day cache
    CACHE_DAY = 24 * CACHE_HOUR
    # Three (commercial) months cache
    CACHE_TRIMESTER = CACHE_DAY * 90

    ##
    # @!attribute region
    #   @return [String] Api region
    attr_accessor :region

    ##
    # @!attribute mode
    #   @return [:regular, :extended]
    attr_accessor :mode

    ##
    # @!macro init_options
    def initialize(**options)
      self.region = options[:region] || BlizzardApi.region
      # Use the shared access_token, or create one if it doesn't exists. This avoids unnecessary calls to create tokens.
      create_access_token if BlizzardApi.access_token_expired?

      # Mode
      @mode = options[:mode] || BlizzardApi.mode
    end

    require 'net/http'
    require 'uri'
    require 'json'
    require 'redis'

    protected

    def create_access_token
      return if BlizzardApi.restore_access_token

      uri = URI.parse("https://#{BlizzardApi.region}.battle.net/oauth/token")

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(uri.path)
      request.basic_auth(BlizzardApi.app_id, BlizzardApi.app_secret)
      request['Content-Type'] = 'application/x-www-form-urlencoded'
      request.set_form_data grant_type: 'client_credentials'

      response = http.request(request)
      BlizzardApi.save_access_token(JSON.parse(response.body))
    end

    def request(url, **options)
      # Creates the whole url for request
      parsed_url = URI.parse(url)

      data = using_cache?(options) ? find_in_cache(parsed_url.to_s) : nil

      # If data was found that means cache is enabled and valid
      return JSON.parse(data, symbolize_names: true) if data

      response = consume_api parsed_url, **options

      save_in_cache parsed_url.to_s, response.body, options[:ttl] || CACHE_DAY if using_cache? options

      response_data = response.code.to_i.eql?(304) ? nil : JSON.parse(response.body, symbolize_names: true)
      return [response, response_data] if mode.eql? :extended

      response_data
    end

    def api_request(uri, **query_string)
      # List of request options
      options_key = %i[ignore_cache ttl format access_token namespace classic classic1x headers since]

      # Separates request options from api fields and options. Any user-defined option will be treated as api field.
      options = query_string.select { |k, _v| query_string.delete(k) || true if options_key.include? k }

      # Namespace
      query_string[:namespace] = endpoint_namespace(options) if options.include? :namespace

      # In case uri already have query string parameters joins them with &
      if query_string.size.positive?
        query_string = URI.encode_www_form(query_string, false)
        uri = uri.include?('?') ? "#{uri}&#{query_string}" : "#{uri}?#{query_string}"
      end

      request uri, **options
    end

    private

    ##
    # @param options [Hash] Request options
    def using_cache?(options)
      return false if mode.eql?(:extended) || options.key?(:since)

      !options.fetch(:ignore_cache, false)
    end

    def http_connection(url)
      Net::HTTP.new(url.host, url.port).tap do |http|
        http.use_ssl = true
      end
    end

    def consume_api(url, **options)
      # Creates a HTTP connection and request to ensure thread safety
      request = Net::HTTP::Get.new(url)

      add_headers request, options

      # Executes the request
      http_connection(url).request(request).tap do |response|
        if mode.eql?(:regular) && ![200, 304].include?(response.code.to_i)
          raise BlizzardApi::ApiException.new "Request failed with code '#{response.code}' details: #{response.to_hash}", response.code.to_i
        end
      end
    end

    def add_headers(request, options)
      # Blizzard API documentation states the preferred way to send the access_token is using Bearer token on header
      request['Authorization'] = "Bearer #{options.fetch(:access_token, BlizzardApi.access_token)}"
      # Format If-modified-since option
      request['If-Modified-Since'] = options[:since].httpdate if options.key? :since
      options[:headers]&.each { |header, content| request[header] = content }
    end

    def save_in_cache(resource_url, data, ttl)
      BlizzardApi.redis_connection.setex resource_url, ttl, data if BlizzardApi.use_cache
    end

    def find_in_cache(resource_url)
      return false unless BlizzardApi.use_cache

      BlizzardApi.redis_connection.get resource_url if BlizzardApi.redis_connection.exists? resource_url
    end
  end
end
