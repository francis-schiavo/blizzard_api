# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft titles
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.title
    class Title < Wow::GenericDataEndpoint
      ##
      # This method overrides the inherited default behavior to prevent high server load and fetch time
      #
      # @!macro response
      def complete
        raise BlizzardApi::ApiException, 'There are too many achievements to fetch complete data'
      end

      protected

      def endpoint_setup
        @endpoint = 'title'
        @namespace = :static
        @collection = 'titles'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
