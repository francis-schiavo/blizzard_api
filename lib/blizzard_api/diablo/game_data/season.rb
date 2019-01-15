# frozen_string_literal: true

module BlizzardApi
  module Diablo
    ##
    # This class allows access to Diablo III season data
    #
    # @see https://develop.battle.net/documentation/api-reference/diablo-3-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Diablo.season
    class Season < Diablo::GenericDataEndpoint
      protected

      def endpoint_setup
        @endpoint = 'season'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
