# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class MythicKeystoneLeaderboardTest < Minitest::Test
      def setup
        @mythic_keystone_leaderboard = BlizzardApi::Wow::MythicKeystoneLeaderboard.new
      end

      def test_mythic_keystone_dungeons
        mythic_keystone_leaderboard_data = @mythic_keystone_leaderboard.index 11
        assert_equal 10, mythic_keystone_leaderboard_data[:current_leaderboards].count
      end

      def test_mythic_keystone_dungeon
        mythic_keystone_leaderboard_data = @mythic_keystone_leaderboard.get 11, 197, 641
        assert_equal 1_523_977_199_000, mythic_keystone_leaderboard_data[:period_end_timestamp]
      end
    end
  end
end
