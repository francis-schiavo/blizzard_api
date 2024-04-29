# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Hearthstone
    class CardTest < Minitest::Test
      def setup
        @card = BlizzardApi::Hearthstone.card
      end

      def test_card_index
        card_data = @card.search
        assert card_data[:cards]
      end

      def test_card_get
        card_data = @card.get 254
        assert card_data[:slug]
      end

      def test_card_search
        search_options = { class: 'mage', mana_cost: 8, attack: 4, health: 12, collectible: 1,
                           rarity: 'legendary', type: 'minion', minion_type: 'dragon', text_filter: 'kalecgos',
                           page: 1, page_size: 5, sort: 'name', order: 'desc' }

        card_data = @card.search(**search_options)
        assert_equal 3, card_data[:cardCount]
        assert_equal 53_002, card_data[:cards][0][:id]
      end
    end
  end
end
