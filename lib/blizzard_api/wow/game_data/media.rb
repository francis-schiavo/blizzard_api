# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft mounts
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.mount
    class Media < Wow::GenericDataEndpoint
      include BlizzardApi::Wow::Searchable

      def index(_options = nil)
        raise BlizzardApi::ApiException, 'This endpoint does not have a index method'
      end

      def get(_options = nil)
        raise BlizzardApi::ApiException, 'This endpoint does not have a get method'
      end

      def complete(_options = nil)
        raise BlizzardApi::ApiException, 'This endpoint does not have a complete method'
      end

      protected

      def endpoint_setup
        @endpoint = 'media'
        @namespace = :static
        @collection = 'medias'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
