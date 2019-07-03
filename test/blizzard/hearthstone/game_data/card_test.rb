# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Hearthstone
    class CardTest < Minitest::Test
      def test_card_index
        card = BlizzardApi::Hearthstone::Card.new
        card_data = card.index
        assert card_data[:cards]
      end

      def test_card_get
        card = BlizzardApi::Hearthstone::Card.new
        card_data = card.get 254
        assert card_data[:slug]
      end
    end
  end
end
