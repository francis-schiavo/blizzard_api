# frozen_string_literal: true

module BlizzardApi
  module Hearthstone
    ##
    # This class allows access to Hearthstone card data
    #
    # @see https://develop.battle.net/documentation/api-reference/hearthstone-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Hearthstone.metadata
    class Metadata < Hearthstone::GenericDataEndpoint
      protected

      def endpoint_setup
        @endpoint = 'metadata'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
