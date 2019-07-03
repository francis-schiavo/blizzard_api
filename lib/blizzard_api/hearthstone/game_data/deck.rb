# frozen_string_literal: true

module BlizzardApi
  module Hearthstone
    ##
    # This class allows access to Hearthstone deck data
    #
    # @see https://develop.battle.net/documentation/api-reference/hearthstone-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Hearthstone.deck
    class Deck < Hearthstone::Request
      def initialize(region = nil)
        super region
        endpoint_setup
        @ttl ||= CACHE_DAY
      end

      def get(deck_code, options = {})
        api_request "#{base_url(:community)}/#{@endpoint}/#{deck_code}", default_options.merge(options)
      end

      protected

      def endpoint_setup
        @endpoint = 'deck'
        @ttl = CACHE_TRIMESTER
      end

      def default_options
        { ttl: @ttl }
      end
    end
  end
end
