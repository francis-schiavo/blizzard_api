# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class MythicKeystoneLeaderboardTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.mythic_keystone_leaderboard
      end

      def test_mythic_keystone_dungeons
        data = @endpoint.index 11
        assert data.key? :current_leaderboards
      end

      def test_mythic_keystone_dungeon
        data = @endpoint.get 11, 197, 641
        assert_equal 1_523_977_199_000, data[:period_end_timestamp]
      end
    end
  end
end
