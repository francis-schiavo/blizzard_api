# frozen_string_literal: true

module BlizzardApi
  # Global configurations
  module Configuration
    ##
    # @!attribute app_id
    #   Application ID.
    #   @see https://develop.battle.net/access/clients
    #   @return [String] Application ID
    attr_accessor :app_id

    ##
    # @!attribute app_secret
    #   Application secret.
    #   @see https://develop.battle.net/access/clients
    #   @return [String] Application secret
    attr_accessor :app_secret

    ##
    # @!attribute region
    #   Default region.
    #   @return [String] Default region
    attr_accessor :region

    ##
    # @!attribute mode
    #   Api response mode :regular or :extended.
    #   @return [Symbol] Default API response mode
    attr_accessor :mode

    ##
    # @!attribute redis_url
    #  Redis connection string. Overrides redis_host, redis_port and redis_database.
    # @see https://redis.io/
    attr_accessor :redis_url

    ##
    # @!attribute cache_access_token
    #   If set to true and cache is enabled the current access token will be cached and recovered from Redis
    #   @return [Boolean] Access token.
    attr_accessor :cache_access_token

    ##
    # This method return the singleton instance of the configuration module. Use this to initialize the default values
    # and options.
    #
    # @yield self
    #
    # @example
    # BlizzardApi.configure do |config|
    #   config.app_id = ENV['BNET_APPLICATION_ID']
    #   config.app_secret = ENV['BNET_APPLICATION_SECRET']
    #   config.region = 'us'
    #   config.redis_url = 'redis://localhost:6379/0'
    #   config.cache_access_token = true
    # end
    def configure
      yield self
    end

    ##
    # Initializes some default values for the main module
    def self.extended(base)
      base.mode = :regular
    end

    def use_cache?
      @use_cache ||= !redis_url.nil?
    end
  end
end
