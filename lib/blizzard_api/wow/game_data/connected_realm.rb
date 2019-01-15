# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft connected realms
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.connected_realms
    class ConnectedRealm < Wow::GenericDataEndpoint
      ##
      # @!macro complete
      def complete(options = {})
        [].tap do |data|
          index_data = index options
          index_data[:connected_realms].each do |realm|
            realm_id = %r{connected-realm/([0-9]+)}.match(realm[:href])[1]
            realm_data = get realm_id, options
            realm_data.delete :_links
            data.push realm_data
          end
        end
      end

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
