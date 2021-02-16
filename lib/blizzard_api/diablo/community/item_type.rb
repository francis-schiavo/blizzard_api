# frozen_string_literal: true

module BlizzardApi
  module Diablo
    ##
    # This class allows access to Diablo III item type data
    #
    # @see https://develop.battle.net/documentation/api-reference/diablo-3-community-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Diablo.item_type
    class ItemType < BlizzardApi::Diablo::Request
      ##
      # Return a list of item types
      #
      # @!macro request_options
      #
      # @!macro response
      def index(**options)
        api_request "#{base_url(:community)}/data/item-type", { ttl: CACHE_TRIMESTER }.merge(options)
      end

      ##
      # Return more information about an item type
      #
      # @param item_type_slug [String] Item type slug
      # @!macro request_options
      #
      # @!macro response
      def get(item_type_slug, **options)
        api_request "#{base_url(:community)}/data/item-type/#{item_type_slug}", { ttl: CACHE_TRIMESTER }.merge(options)
      end
    end
  end
end
