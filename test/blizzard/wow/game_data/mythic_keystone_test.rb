# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class MythicKeystoneTest < Minitest::Test
      def setup
        @mythic_keystone_leaderboard = BlizzardApi::Wow::MythicKeystone.new
      end

      def test_mythic_keystone_dungeons
        mythic_keystone_dungeons_data = @mythic_keystone_leaderboard.index
        assert_equal 1, mythic_keystone_dungeons_data[:dungeons].count
      end

      def test_mythic_keystone_dungeon
        mythic_keystone_dungeon_data = @mythic_keystone_leaderboard.dungeon 244
        assert_equal 'Atal\'Dazar', mythic_keystone_dungeon_data[:name][:en_US]
      end

      def test_mythic_keystone
        mythic_keystone_data = @mythic_keystone_leaderboard.index
        assert mythic_keystone_data.include? :seasons
        assert mythic_keystone_data.include? :dungeons
      end

      def test_mythic_keystone_periods
        mythic_keystone_periods = @mythic_keystone_leaderboard.periods
        assert_equal 66, mythic_keystone_periods[:periods].count
      end

      def test_mythic_keystone_period
        mythic_keystone_period_data = @mythic_keystone_leaderboard.period 641
        assert_equal 1_523_977_199_000, mythic_keystone_period_data[:end_timestamp]
      end

      def test_mythic_keystone_seasons
        mythic_keystone_seasons_data = @mythic_keystone_leaderboard.seasons
        assert_equal 4, mythic_keystone_seasons_data[:seasons].count
      end

      def test_mythic_keystone_season
        mythic_keystone_season_data = @mythic_keystone_leaderboard.season 1
        assert_equal 1_548_169_200_000, mythic_keystone_season_data[:end_timestamp]
      end
    end
  end
end
