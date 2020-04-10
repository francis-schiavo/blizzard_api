# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class MythicRaidLeaderboardTest < Minitest::Test
      def setup
        @mythic_raid_leaderboard = BlizzardApi::Wow.mythic_raid_leaderboard
      end

      def test_mythic_raid_leaderboard_get
        mythic_raid_leaderboard_data = @mythic_raid_leaderboard.get 'uldir', 'alliance'
        assert_equal 'hall-of-fame', mythic_raid_leaderboard_data[:criteria_type]
      end
    end
  end
end
