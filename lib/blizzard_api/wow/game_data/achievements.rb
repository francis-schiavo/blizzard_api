# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft achievements
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.achievements
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

      def complete(options = {})
        raise BlizzardApi::ApiException, 'There are too many achievements to fetch complete data'
      end

      ##
      # Return a list of possible character achievements.
      # This endpoint uses a community endpoint. It is recommended to use the new data endpoint using {#index}.
      # @see https://us.battle.net/forums/en/bnet/topic/20771546990
      #
      # @!macro request_options
      #
      # @!macro response
      def character_achievement_index(options = {})
        api_request "#{base_url(:community)}/data/character/achievements", { ttl: CACHE_TRIMESTER }.merge(options)
      end

      ##
      # Return a list of possible guild achievements
      # This endpoint uses a community endpoint. It is recommended to use the new data endpoint using {#index}.
      # @see https://us.battle.net/forums/en/bnet/topic/20771546990
      #
      # @!macro request_options
      #
      # @!macro response
      def guild_achievement_index(options = {})
        api_request "#{base_url(:community)}/data/guild/achievements", { ttl: CACHE_TRIMESTER }.merge(options)
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
