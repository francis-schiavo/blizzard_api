# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft playable classes
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.playable_class
    class PlayableClass < Wow::GenericDataEndpoint
      ##
      # Returns a index of playable classes
      #
      # @!macro request_options
      # @option options [Boolean] :use_community_endpoint If set to true, this method will call the community endpoint
      #   instead of the data endpoint https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
      #
      # @!macro response
      def index(options = {})
        return super options unless options.include? :use_community_endpoint

        api_request "#{base_url(:community)}/data/character/classes", { ttl: CACHE_TRIMESTER }.merge(options)
      end

      ##
      # Returns the PvP talent slots data of a specific class
      #
      # @param id [Integer] Class id to fetch talent data. One of the IDs returned by the {index} method
      # @!macro request_options
      #
      # @!macro response
      def talent_slots(id, options = {})
        api_request "#{base_url(:game_data)}/#{@endpoint}/#{id}/pvp-talent-slots", default_options.merge(options)
      end

      ##
      # @!macro complete
      def complete(options = {})
        index_data = index options
        [].tap do |classes|
          index_data[:classes].each do |pclass|
            class_id = %r{playable-class/([0-9]+)}.match(pclass[:key].to_s)[1]
            class_data = get class_id, options
            class_data.delete :_links
            classes.push class_data
          end
        end
      end

      protected

      def endpoint_setup
        @endpoint = 'playable-class'
        @namespace = endpoint_namespace :static
        @collection = 'classes'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
