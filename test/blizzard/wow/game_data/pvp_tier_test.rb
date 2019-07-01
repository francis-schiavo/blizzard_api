# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PvpTierTest < Minitest::Test
      def setup
        @pvp = BlizzardApi::Wow::PvpTier.new
      end

      def test_pvp_tier_index
        pvp_data = @pvp.index
        assert_equal 18, pvp_data[:tiers].count
      end

      def test_pvp_tier_get
        pvp_data = @pvp.get 1
        assert_equal 'Unranked', pvp_data[:name][:en_US]
      end

      def test_pvp_tier_media
        pvp_data = @pvp.tier_media 1
        assert_equal 'https://render-us.worldofwarcraft.com/icons/56/ui_rankedpvp_01.jpg', pvp_data[:assets][0][:value]
      end
    end
  end
end
