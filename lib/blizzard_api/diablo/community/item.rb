# frozen_string_literal: true

module BlizzardApi
  module Diablo
    ##
    # This class allows access to Diablo III item data
    #
    # @see https://develop.battle.net/documentation/api-reference/diablo-3-community-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Diablo.item
    class Item < BlizzardApi::Diablo::Request
      ##
      # Return information about an item
      #
      # @param item_slug [String] Item slug
      # @!macro request_options
      #
      # @!macro response
      def get(item_slug_and_id, options = {})
        api_request "#{base_url(:community)}/data/item/#{item_slug_and_id}", { ttl: CACHE_TRIMESTER }.merge(options)
      end
    end
  end
end
