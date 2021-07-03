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
    # @!attribute use_cache
    #   If true requests will be cached using a Redis server.
    #   @see https://redis.io/
    #   @return [Boolean] Application ID
    attr_accessor :use_cache

    ##
    # @!attribute redis_host
    #   Redis host.
    #   @see https://redis.io/
    #   @return [String] Redis host
    attr_accessor :redis_host

    ##
    # @!attribute redis_port
    #   Redis port.
    #   @see https://redis.io/
    #   @return [Integer] Redis port
    attr_accessor :redis_port

    ##
    #
    # @!attribute concurrency
    #   How many threads to use for WoW game data `complete` payloads. Defaults to 4.
    #   Should be set to the amount of available cores on the system.
    #   @return [Integer] Concurrency
    attr_writer :concurrency

    ##
    # @!attribute access_token
    #   Access token. Optional. If you don't provide one it will be generate using your client credentials.
    #   @return [String] Access token.
    attr_accessor :access_token

    ##
    # This method return the singleton instance of the configuration module. Use this to initialize the default values
    # and options.
    #
    # @yield self
    #
    # @example
    #   BlizzardApi.configure do |config|
    #     config.app_id = ENV['BNET_APPLICATION_ID']
    #     config.app_secret = ENV['BNET_APPLICATION_SECRET']
    #     config.region = 'us'
    #
    #     config.use_cache = true
    #     config.redis_host = ENV['REDIS_HOST']
    #     config.redis_port = ENV['REDIS_PORT']
    #     config.format = :json
    #
    #     config.icons_directory = './wow/icons'
    #     config.guild_crest_directory = './wow/guild_crest'
    #     config.wow_character_profile_directory = './wow/profile'
    #   end
    def configure
      yield self
    end

    def concurrency
      @concurrency ||= 4
    end
  end
end
