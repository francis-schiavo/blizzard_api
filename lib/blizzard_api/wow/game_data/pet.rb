# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft pet data
    #
    # @see https://develop.battle.net/documentation/world-of-warcraft/game-data-apis
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.pet
    class Pet < Wow::GenericDataEndpoint
      protected

      def endpoint_setup
        @endpoint = 'pet'
        @namespace = :static
        @collection = 'pets'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
