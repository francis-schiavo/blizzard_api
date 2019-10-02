# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class ReputationTierTest < Minitest::Test
      def setup
        @reputation = BlizzardApi::Wow::ReputationTier.new
      end

      def test_reputation_tier_index
        reputation_data = @reputation.index
        assert_equal 37, reputation_data[:reputation_tiers].count
      end

      def test_reputation_tier_get
        reputation_data = @reputation.get 26
        assert_equal 'Nat Pagle', reputation_data[:faction][:name][:en_US]
      end
    end
  end
end
