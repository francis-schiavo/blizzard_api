# frozen_string_literal: true

##
# @!macro [new] request_options
#   @param {Hash} options You can specify some options
#   @option options [String] :locale Overrides the default locale for a single call
#   @option options [String] :namespace Overrides the default namespace for a single call
#   @option options [String] :access_token Overrides the access_token for a single call
#   @option options [Boolean] :ignore_cache If set to true the request will not use the cache
#   @option options [Integer] :ttl Override the default time (in seconds) a request should be cached

##
# @!macro [new] regions
#   @param {Symbol} region One of the valid API regions *:us*, *:eu*, *:ko*, and *:tw*
#   @note This gem do not support nor will support China endpoints

##
# @!macro [new] response
#   @return [OpenStruct,Array] API Response. The actual type of the returned object depends on the *format* option
#   in the configuration module

##
# @!macro [new] complete
#   Iterates through the {index} response data and fetch additional information using {get}, it results in a more
#   complete set of data
#   @note IT MAY PERFORM MANY REQUESTS TO FETCH ALL DATA
#   @!macro request_options
#   @!macro response

module BlizzardApi
  ##
  # Simplifies the requests to Blizzard APIS
  class Request
    # One minute cache
    CACHE_MINUTE = 60
    # One hour cache
    CACHE_HOUR = 60 * CACHE_MINUTE
    # One day cache
    CACHE_DAY = 24 * CACHE_HOUR
    # One week cache
    CACHE_WEEK = CACHE_DAY * 7
    # One (commercial) month cache
    CACHE_MONTH = CACHE_DAY * 30
    # Three (commercial) months cache
    CACHE_TRIMESTER = CACHE_MONTH * 3

    # Common endpoints
    BASE_URLS = {
      game_data: 'https://%s.api.blizzard.com/data/%s',
      community: 'https://%s.api.blizzard.com/%s',
      profile: 'https://%s.api.blizzard.com/profile/%s',
      media: 'https://%s.api.blizzard.com/data/%s/media',
      user_profile: 'https://%s.api.blizzard.com/profile/user/%s',
      search: 'https://%s.api.blizzard.com/data/%s/search'
    }.freeze

    ##
    # @!attribute region
    #   @return [String] Api region
    attr_accessor :region

    ##
    # @!macro regions
    def initialize(region = nil)
      self.region = region || BlizzardApi.region
      @redis = Redis.new(host: BlizzardApi.redis_host, port: BlizzardApi.redis_port) if BlizzardApi.use_cache
      # Use the shared access_token, or create one if it doesn't exists. This avoids unnecessary calls to create tokens.
      @access_token = BlizzardApi.access_token || create_access_token
    end

    require 'net/http'
    require 'uri'
    require 'json'
    require 'redis'

    protected

    def base_url(scope)
      raise ArgumentError, 'Invalid scope' unless BASE_URLS.include? scope

      format BASE_URLS[scope], region, @game
    end

    ##
    # Returns a valid namespace string for consuming the api endpoints
    #
    # @param [Hash] options A hash containing the namespace key
    def endpoint_namespace(options)
      case options[:namespace]
      when :dynamic
        "dynamic-#{region}"
      when :static
        options.include?(:classic) ? "static-classic-#{region}" : "static-#{region}"
      when :profile
        "profile-#{region}"
      else
        raise ArgumentError, 'Invalid namespace scope'
      end
    end

    def string_to_slug(string)
      CGI.escape(string.downcase.tr(' ', '-'))
    end

    def create_access_token
      uri = URI.parse("https://#{BlizzardApi.region}.battle.net/oauth/token")

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(uri.path)
      request.basic_auth(BlizzardApi.app_id, BlizzardApi.app_secret)
      request['Content-Type'] = 'application/x-www-form-urlencoded'
      request.set_form_data grant_type: 'client_credentials'

      response = http.request(request)
      BlizzardApi.access_token = JSON.parse(response.body)['access_token']
    end

    def request(url, options = {})
      # Creates the whole url for request
      parsed_url = URI.parse(url)

      data = options[:ignore_cache] ? nil : find_in_cache(parsed_url.to_s)
      # If data was found that means cache is enabled and valid
      return format_response data if data

      # Override access_token
      @access_token = options[:access_token] if options.include? :access_token

      response = consume_api parsed_url

      unless options[:ignore_cache]
        ttl = options[:ttl] || CACHE_DAY
        save_in_cache parsed_url.to_s, response.body, ttl
      end

      format_response response.body
    end

    def api_request(uri, query_string = {})
      # List of request options
      options_key = %i[ignore_cache ttl format access_token namespace classic]

      # Separates request options from api fields and options. Any user-defined option will be treated as api field.
      options = query_string.select { |k, _v| query_string.delete(k) || true if options_key.include? k }

      # Namespace
      query_string[:namespace] = endpoint_namespace(options) if options.include? :namespace

      # In case uri already have query string parameters joins them with &
      if query_string.size.positive?
        query_string = URI.encode_www_form(query_string, false)
        uri = uri.include?('?') ? "#{uri}&#{query_string}" : "#{uri}?#{query_string}"
      end

      request uri, options
    end

    private

    def consume_api(url)
      # Creates a HTTP connection and request to ensure thread safety
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(url)

      # Blizzard API documentation states the preferred way to send the access_token is using Bearer token on header
      request['Authorization'] = "Bearer #{@access_token}"

      # Executes the request
      http.request(request).tap do |response|
        raise BlizzardApi::ApiException.new 'Request failed', response.code.to_i unless response.code.to_i == 200
      end
    end

    def save_in_cache(resource_url, data, ttl)
      return nil unless BlizzardApi.use_cache

      @redis.setex resource_url, ttl, data
    end

    def find_in_cache(resource_url)
      return false unless BlizzardApi.use_cache

      @redis.get resource_url if @redis.exists resource_url
    end

    def format_response(data)
      JSON.parse(data, symbolize_names: true)
    end
  end
end
