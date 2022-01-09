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

      setup 'media', :static, CACHE_TRIMESTER

      def index(_options = nil)
        raise BlizzardApi::ApiException, 'This endpoint does not have a index method'
      end

      def get(_options = nil)
        raise BlizzardApi::ApiException, 'This endpoint does not have a get method'
      end
    end
  end
end
