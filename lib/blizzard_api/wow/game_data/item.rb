# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft item data
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.item
    class Item < Wow::GenericDataEndpoint
      ##
      # This method overrides the inherited default behavior to prevent high server load and fetch time
      #
      # @!macro response
      def index
        raise BlizzardApi::ApiException, 'This endpoint does not have a index method'
      end

      ##
      # This method overrides the inherited default behavior to prevent high server load and fetch time
      #
      # @!macro response
      def complete
        raise BlizzardApi::ApiException, 'This endpoint does not have a complete method'
      end

      ##
      # Return complete data of an item by id
      #
      # @param id [Integer] Item id
      # @!macro request_options
      # @option options [Boolean] :use_community_endpoint If set to true, this method will call the community endpoint
      #   instead of the data endpoint https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
      #
      # @!macro response
      def get(id, options = {})
        return super id, options unless options.include? :use_community_endpoint

        api_request "#{base_url(:community)}/item/#{id}", { ttl: CACHE_TRIMESTER }.merge(options)
      end

      ##
      # Return complete data of an item set by id
      #
      # @param set_id [Integer] Item set id
      # @!macro request_options
      #
      # @!macro response
      def item_set(set_id, options = {})
        api_request "#{base_url(:community)}/item/set/#{set_id}", { ttl: CACHE_TRIMESTER }.merge(options)
      end

      ##
      # Return a list of item classes
      #
      # @!macro request_options
      # @option options [Boolean] :use_community_endpoint If set to true, this method will call the community endpoint
      #   instead of the data endpoint https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
      #
      # @!macro response
      def classes(options = {})
        if options.include? :use_community_endpoint
          return api_request "#{base_url(:community)}/data/item/classes", { ttl: CACHE_TRIMESTER }.merge(options)
        end

        api_request "#{endpoint_uri('class')}/index", default_options.merge(options)
      end

      ##
      # Return data about an item class
      #
      # @param id [Integer] Item class id
      # @!macro request_options
      #
      # @!macro response
      def class(id, options = {})
        api_request "#{endpoint_uri('class')}/#{id}", default_options.merge(options)
      end

      ##
      # Return all subclasses of a given class
      #
      # @param id [Integer] Item class id
      # @param subclass_id [Integer] Item subclass id
      # @!macro request_options
      #
      # @!macro response
      def subclass(id, subclass_id, options = {})
        api_request "#{endpoint_uri('class')}/#{id}/item-subclass/#{subclass_id}", default_options.merge(options)
      end

      ##
      # Fetch media for an item using its *id*
      #
      # @param id [Integer] Item id
      #
      # @!macro request_options
      #
      # @!macro response
      def media(id, options = {})
        api_request "#{base_url(:media)}/item/#{id}", default_options.merge(options)
      end

      protected

      def endpoint_setup
        @endpoint = 'item'
        @namespace = endpoint_namespace :static
        @collection = 'items'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
