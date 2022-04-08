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

        pvp_data = @pvp.index classic: true
        assert pvp_data.key? :seasons
      end

      def test_pvp_season_get
        pvp_data = @pvp.get 27
        assert pvp_data.key? :season_start_timestamp

        pvp_data = @pvp.get 2, classic: true
        assert pvp_data.key? :season_start_timestamp
      end

      def test_pvp_season_leaderboards
        pvp_data = @pvp.leaderboards 27
        assert pvp_data.key? :leaderboards
      end

      def test_pvp_season_leaderboard
        pvp_data = @pvp.leaderboard 27, '3v3'
        assert pvp_data.key? :entries
      end

      def test_pvp_season_rewards
        pvp_data = @pvp.rewards 27
        assert pvp_data.key? :rewards
      end
    end
  end
end
