# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PvpRegionTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.pvp_region
      end

      def test_pvp_region_index
        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.index classic: true
        assert data.key? :pvp_regions
      end

      def test_pvp_regional_season_index
        data = @endpoint.seasons 1, classic: true
        assert data.key? :seasons
      end

      def test_pvp_regional_season
        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.season 1, 4, classic: true
        assert data.key? :season_start_timestamp
      end

      def test_pvp_regional_season_leaderboards
        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.leaderboards 1, 4, classic: true
        assert data.key? :leaderboards
      end

      def test_pvp_regional_season_leaderboard
        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.leaderboard 1, 4, '3v3', classic: true
        assert data.key? :entries
      end

      def test_pvp_regional_season_rewards
        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.rewards 1, 4, classic: true
        assert data.key? :rewards
      end
    end
  end
end
