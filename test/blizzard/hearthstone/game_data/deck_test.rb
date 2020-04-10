# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Hearthstone
    class DeckTest < Minitest::Test
      def setup
        @deck = BlizzardApi::Hearthstone.deck
      end

      def test_deck_get
        deck_data = @deck.get 'AAECAQcG+wyd8AKS+AKggAOblAPanQMMS6IE/web8wLR9QKD+wKe+wKz/AL1gAOXlAOalAOSnwMA'
        assert deck_data[:hero]
      end
    end
  end
end
