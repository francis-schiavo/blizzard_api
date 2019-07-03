# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Hearthstone
    class DeckTest < Minitest::Test
      def test_deck_get
        deck = BlizzardApi::Hearthstone::Deck.new
        deck_data = deck.get 'AAECAQcG+wyd8AKS+AKggAOblAPanQMMS6IE/web8wLR9QKD+wKe+wKz/AL1gAOXlAOalAOSnwMA'
        assert deck_data[:hero]
      end
    end
  end
end
