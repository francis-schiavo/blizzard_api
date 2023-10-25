# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft tokens
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.wow_token
    class WowToken < GenericDataEndpoint
      setup 'token', :dynamic, CACHE_HOUR

      def get
        raise BlizzardApi::ApiException, 'This endpoint does not have a get method'
      end
    end
  end
end
