# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft regions
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.region
    class Region < Wow::GenericDataEndpoint
      ##
      # @!macro complete
      def complete(options = {})
        [].tap do |data|
          index_data = index options
          index_data[:regions].each do |region|
            region_data = request region[:href], options
            region_data.delete :_links
            data.push region_data
          end
        end
      end

      ##
      # Returns data about region battlegroups
      #
      # This method is actually located at the community API, but it is included here due to its relevance.
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
      #
      # @!macro request_options
      #
      # @!macro response
      def battlegroups(options = {})
        api_request "#{base_url(:community)}/data/battlegroups/", { ttl: CACHE_TRIMESTER }.merge(options)
      end

      protected

      def endpoint_setup
        @endpoint = 'region'
        @namespace = endpoint_namespace :dynamic
        @collection = 'regions'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
