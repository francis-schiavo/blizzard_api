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
    class Item < Wow::Request
      ##
      # Return complete data of an item by id
      #
      # @param id [Integer] Item id
      # @!macro request_options
      #
      # @!macro response
      def get(id, options = {})
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
      #
      # @!macro response
      def classes(options = {})
        api_request "#{base_url(:community)}/data/item/classes", { ttl: CACHE_TRIMESTER }.merge(options)
      end
    end
  end
end
