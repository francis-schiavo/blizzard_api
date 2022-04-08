# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft reputation
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.reputation
    class Reputation < Wow::GenericDataEndpoint
      setup 'reputation', :static, CACHE_TRIMESTER

      ##
      # This method overrides the inherited default behavior to prevent high server load and fetch time
      #
      # @!macro response
      def index
        raise BlizzardApi::ApiException, 'This endpoint does not have an index method'
      end

      ##
      # This method overrides the inherited default behavior to prevent high server load and fetch time
      #
      # @!macro response
      def get
        raise BlizzardApi::ApiException, 'This endpoint does not have a get method'
      end

      ##
      # Return a list of reputation factions
      #
      # @!macro request_options
      #
      # @!macro response
      def factions(**options)
        api_request "#{endpoint_uri('faction')}/index", **default_options.merge(options)
      end

      ##
      # Return data about a reputation faction
      #
      # @param id [Integer] Reputation faction id
      # @!macro request_options
      #
      # @!macro response
      def faction(id, **options)
        api_request "#{endpoint_uri('faction')}/#{id}", **default_options.merge(options)
      end

      ##
      # Return a list of reputation tiers
      #
      # @!macro request_options
      #
      # @!macro response
      def tiers(**options)
        api_request "#{endpoint_uri('tiers')}/index", **default_options.merge(options)
      end

      ##
      # Return data about a reputation tier
      #
      # @param id [Integer] Reputation tier id
      # @!macro request_options
      #
      # @!macro response
      def tier(id, **options)
        api_request "#{endpoint_uri('tiers')}/#{id}", **default_options.merge(options)
      end
    end
  end
end
