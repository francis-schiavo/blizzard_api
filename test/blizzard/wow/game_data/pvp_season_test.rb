# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PvpSeasonTest < Minitest::Test
      def setup
        @pvp = BlizzardApi::Wow.pvp_season
      end

      def test_pvp_season_index
        pvp_data = @pvp.index
        assert pvp_data.key? :seasons
      end

      def test_pvp_season_get
        pvp_data = @pvp.get 27
        assert_equal 1_561_471_200_000, pvp_data[:season_end_timestamp]
      end

      def test_pvp_season_leaderboards
        pvp_data = @pvp.leaderboards 27
        assert_equal 3, pvp_data[:leaderboards].count
      end

      def test_pvp_season_leaderboard
        pvp_data = @pvp.leaderboard 27, '3v3'
        assert_equal 5_008, pvp_data[:entries].count
      end

      def test_pvp_season_rewards
        pvp_data = @pvp.rewards 27
        assert_equal 4, pvp_data[:rewards].count
      end
    end
  end
end
