# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class ReputationFactionTest < Minitest::Test
      def setup
        @reputation = BlizzardApi::Wow::ReputationFaction.new
      end

      def test_reputation_tier_index
        reputation_data = @reputation.index
        assert_equal 196, reputation_data[:factions].count
      end

      def test_reputation_tier_get
        reputation_data = @reputation.get 1105
        assert_equal 'The Oracles', reputation_data[:name][:en_US]
      end
    end
  end
end
