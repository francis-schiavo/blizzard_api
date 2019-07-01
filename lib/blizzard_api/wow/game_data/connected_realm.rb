# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft connected realms
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.connected_realm
    class ConnectedRealm < Wow::GenericDataEndpoint
      protected

      def endpoint_setup
        @endpoint = 'connected-realm'
        @namespace = endpoint_namespace :dynamic
        @collection = 'connected_realms'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
