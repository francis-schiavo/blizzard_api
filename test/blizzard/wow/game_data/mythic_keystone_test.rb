# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class MythicKeystoneTest < Minitest::Test
      def setup
        @mythic_keystone = BlizzardApi::Wow.mythic_keystone
      end

      def test_mythic_keystone_dungeons
        mythic_keystone_dungeons_data = @mythic_keystone.index
        assert_equal 1, mythic_keystone_dungeons_data[:dungeons].count
      end

      def test_mythic_keystone_dungeon
        mythic_keystone_dungeon_data = @mythic_keystone.dungeon 2
        assert_equal 'Temple of the Jade Serpent', mythic_keystone_dungeon_data[:name][:en_US]
      end

      def test_mythic_keystone
        mythic_keystone_data = @mythic_keystone.index
        assert mythic_keystone_data.include? :seasons
        assert mythic_keystone_data.include? :dungeons
      end

      def test_mythic_keystone_periods
        mythic_keystone_periods = @mythic_keystone.periods
        assert mythic_keystone_periods.key? :periods
      end

      def test_mythic_keystone_period
        mythic_keystone_period_data = @mythic_keystone.period 641
        assert_equal 1_523_977_199_000, mythic_keystone_period_data[:end_timestamp]
      end

      def test_mythic_keystone_seasons
        mythic_keystone_seasons_data = @mythic_keystone.seasons
        assert mythic_keystone_seasons_data.key? :seasons
      end

      def test_mythic_keystone_season
        mythic_keystone_season_data = @mythic_keystone.season 1
        assert_equal 1_548_169_200_000, mythic_keystone_season_data[:end_timestamp]
      end
    end
  end
end
