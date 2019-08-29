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
      # @param realms [Array<String>] An optional list of realm-slugs to filter results
      # @!macro request_options
      #
      # @!macro response
      def status(realms = [], options = {})
        options[:realms] = realms.map(&:string_to_slug).join(',') if realms.count.positive?
        api_request "#{base_url(:community)}/realm/status", { ttl: CACHE_MINUTE }.merge(options)
      end

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
