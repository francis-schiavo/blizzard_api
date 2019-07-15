# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft achievements
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.mythic_keystone
    class MythicKeystone < Wow::GenericDataEndpoint
      def get
        raise BlizzardApi::ApiException, 'Mythic keystone endpoint does not have a get method'
      end

      def complete
        raise BlizzardApi::ApiException, 'There are too many creatures to fetch complete data'
      end

      ##
      # Fetch all mythic keystone dungeons
      #
      # @!macro request_options
      #
      # @!macro response
      def dungeons(options = {})
        api_request "#{endpoint_uri}/dungeon/index", default_options.merge(options)
      end

      ##
      # Fetch all possible data for one of the items listed by the {#dungeons} using its *id*
      #
      # @param id [Integer] Dungeon id
      #
      # @!macro request_options
      #
      # @!macro response
      def dungeon(id, options = {})
        api_request "#{endpoint_uri}/dungeon/#{id}", default_options.merge(options)
      end

      ##
      # Fetch all mythic keystone periods
      #
      # @!macro request_options
      #
      # @!macro response
      def periods(options = {})
        api_request "#{endpoint_uri}/period/index", default_options.merge(options)
      end

      ##
      # Fetch all possible data for one of the items listed by the {#periods} using its *id*
      #
      # @param id [Integer] Mythic keystone period id
      #
      # @!macro request_options
      #
      # @!macro response
      def period(id, options = {})
        api_request "#{endpoint_uri}/period/#{id}", default_options.merge(options)
      end

      ##
      # Fetch all mythic keystone seasons
      #
      # @!macro request_options
      #
      # @!macro response
      def seasons(options = {})
        api_request "#{endpoint_uri}/season/index", default_options.merge(options)
      end

      ##
      # Fetch all possible data for one of the items listed by the {#seasons} using its *id*
      #
      # @param id [Integer] Mythic keystone season id
      #
      # @!macro request_options
      #
      # @!macro response
      def season(id, options = {})
        api_request "#{endpoint_uri}/season/#{id}", default_options.merge(options)
      end

      protected

      def endpoint_setup
        @endpoint = 'mythic-keystone'
        @namespace = endpoint_namespace :dynamic
        @collection = 'mythic-keystones'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
