# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft regions
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.region
    class Region < Wow::GenericDataEndpoint
      protected

      def endpoint_setup
        @endpoint = 'region'
        @namespace = :dynamic
        @collection = 'regions'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
