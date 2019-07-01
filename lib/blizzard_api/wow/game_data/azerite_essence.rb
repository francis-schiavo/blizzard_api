# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft azerite essences
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.azerite_essence
    class AzeriteEssence < Wow::GenericDataEndpoint
      protected

      def endpoint_setup
        @endpoint = 'azerite-essence'
        @namespace = endpoint_namespace :static
        @collection = 'azerite_essences'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
