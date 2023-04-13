# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PvpTierTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.pvp_tier
      end

      def test_pvp_tier_index
        data = @endpoint.index
        assert data.key? :tiers
      end

      def test_pvp_tier_get
        data = @endpoint.get 1
        assert_equal 'Unranked', data.dig(:name, :en_US)
      end

      def test_pvp_tier_media
        data = @endpoint.tier_media 1
        assert_equal 'https://render.worldofwarcraft.com/us/icons/56/ui_rankedpvp_01.jpg', data.dig(:assets, 0, :value)
      end
    end
  end
end
