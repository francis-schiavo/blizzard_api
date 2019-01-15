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
      ##
      # This method is actually located at the community scope, but included here because of its relevance
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
      #
      # @!macro request_options
      #
      # @!macro response
      def status(options = {})
        api_request "#{base_url(:community)}/realm/status", { ttl: CACHE_MINUTE }.merge(options)
      end

      ##
      # @!macro complete
      def complete(options = {})
        index_data = index options
        [].tap do |realms|
          index_data[:realms].each do |realm|
            realm_data = get realm[:id], options
            realm_data.delete :_links
            realm_data[:region].delete :key
            realms.push realm_data
          end
        end
      end

      protected

      def endpoint_setup
        @endpoint = 'realm'
        @namespace = endpoint_namespace :dynamic
        @collection = 'realms'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
