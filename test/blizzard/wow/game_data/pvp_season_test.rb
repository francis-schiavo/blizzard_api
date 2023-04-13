# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PvpSeasonTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.pvp_season
      end

      def test_pvp_season_index
        data = @endpoint.index
        assert data.key? :seasons

        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.index classic: true
        assert data.key? :seasons
      end

      def test_pvp_season_get
        data = @endpoint.get 33
        assert data.key? :season_start_timestamp

        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.get 4, classic: true
        assert data.key? :season_start_timestamp
      end

      def test_pvp_season_leaderboards
        data = @endpoint.leaderboards 27
        assert data.key? :leaderboards
      end

      def test_pvp_season_leaderboard
        data = @endpoint.leaderboard 27, '3v3'
        assert data.key? :entries
      end

      def test_pvp_season_rewards
        data = @endpoint.rewards 27
        assert data.key? :rewards
      end
    end
  end
end
