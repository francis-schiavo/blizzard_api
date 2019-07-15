# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft achievements
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.achievement
    class Achievement < Wow::GenericDataEndpoint
      ##
      # Fetch all possible data for one of the items listed by the {#index} using its *id*
      #
      # @param id [Integer] One of the IDs returned by the {#index}
      #
      # @!macro request_options
      # @option options [Boolean] :use_community_endpoint If set to true, this method will call the community endpoint
      #   instead of the data endpoint https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
      #
      # @!macro response
      def get(id, options = {})
        return super id, options unless options.include? :use_community_endpoint

        api_request "#{base_url(:community)}/achievement/#{id}", { ttl: CACHE_TRIMESTER }.merge(options)
      end

      ##
      # This method overrides the inherited default behavior to prevent high server load and fetch time
      #
      # @!macro response
      def complete
        raise BlizzardApi::ApiException, 'There are too many achievements to fetch complete data'
      end

      ##
      # Return a list of possible achievement categories.
      #
      # @!macro request_options
      #
      # @!macro response
      def categories(options = {})
        api_request "#{endpoint_uri('category')}/index", default_options.merge(options)
      end

      ##
      # Return a achievement category.
      #
      # @!macro request_options
      #
      # @!macro response
      def category(id, options = {})
        api_request "#{endpoint_uri('category')}/#{id}", default_options.merge(options)
      end

      ##
      # Fetch media assets for the specified achievement
      #
      # @!macro request_options
      #
      # @!macro response
      def media(id, options = {})
        api_request "#{base_url(:media)}/achievement/#{id}", default_options.merge(options)
      end

      protected

      def endpoint_setup
        @endpoint = 'achievement'
        @namespace = endpoint_namespace :static
        @collection = 'achievements'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
