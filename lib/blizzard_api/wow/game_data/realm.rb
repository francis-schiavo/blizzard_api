# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft realms
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.realm
    class Realm < Wow::GenericDataEndpoint
      include BlizzardApi::Wow::Searchable

      protected

      def endpoint_setup
        @endpoint = 'realm'
        @namespace = :dynamic
        @collection = 'realms'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
