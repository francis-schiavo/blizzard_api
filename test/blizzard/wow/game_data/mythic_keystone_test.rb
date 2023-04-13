# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class MythicKeystoneTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.mythic_keystone
      end

      def test_mythic_keystone_dungeons
        data = @endpoint.index
        assert_equal 1, data[:dungeons].count
      end

      def test_mythic_keystone_dungeon
        data = @endpoint.dungeon 2
        assert_equal 'Temple of the Jade Serpent', data.dig(:name, :en_US)
      end

      def test_mythic_keystone
        data = @endpoint.index
        assert data.include? :seasons
        assert data.include? :dungeons
      end

      def test_mythic_keystone_periods
        data = @endpoint.periods
        assert data.key? :periods
      end

      def test_mythic_keystone_period
        data = @endpoint.period 641
        assert_equal 1_523_977_199_000, data[:end_timestamp]
      end

      def test_mythic_keystone_seasons
        data = @endpoint.seasons
        assert data.key? :seasons
      end

      def test_mythic_keystone_season
        data = @endpoint.season 1
        assert_equal 1_548_169_200_000, data[:end_timestamp]
      end
    end
  end
end
