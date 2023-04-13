# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class ReputationTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.reputation
      end

      def test_reputation_faction_index
        data = @endpoint.factions
        assert data.key? :factions
      end

      def test_reputation_faction_get
        data = @endpoint.faction 1105
        assert_equal 'The Oracles', data.dig(:name, :en_US)
      end

      def test_reputation_tier_index
        data = @endpoint.tiers
        assert data.key? :reputation_tiers
      end

      def test_reputation_tier_get
        data = @endpoint.tier 26
        assert_equal 'Nat Pagle', data.dig(:faction, :name, :en_US)
      end
    end
  end
end
