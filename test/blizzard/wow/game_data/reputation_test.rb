# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class ReputationTest < Minitest::Test
      def setup
        @reputation = BlizzardApi::Wow.reputation
      end

      def test_reputation_faction_index
        reputation_data = @reputation.factions
        assert reputation_data.key? :factions
      end

      def test_reputation_faction_get
        reputation_data = @reputation.faction 1105
        assert_equal 'The Oracles', reputation_data[:name][:en_US]
      end

      def test_reputation_tier_index
        reputation_data = @reputation.tiers
        assert_equal 37, reputation_data[:reputation_tiers].count
      end

      def test_reputation_tier_get
        reputation_data = @reputation.tier 26
        assert_equal 'Nat Pagle', reputation_data[:faction][:name][:en_US]
      end
    end
  end
end
