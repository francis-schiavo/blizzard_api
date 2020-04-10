# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Diablo
    class SeasonTest < Minitest::Test
      def setup
        @season = BlizzardApi::Diablo.season
      end

      def test_season_index
        season_data = @season.index
        assert season_data[:season]
      end

      def test_season_get
        season_data = @season.get 1
        assert season_data[:leaderboard]
      end

      def test_season_leaderboard
        season_data = @season.leaderboard 1, 'achievement-points'
        assert season_data[:row]
      end
    end
  end
end
