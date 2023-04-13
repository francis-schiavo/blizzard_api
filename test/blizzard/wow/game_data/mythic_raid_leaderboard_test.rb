# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class MythicRaidLeaderboardTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.mythic_raid_leaderboard
      end

      def test_mythic_raid_leaderboard_get
        data = @endpoint.get 'uldir', 'alliance'
        assert_equal 'hall-of-fame', data[:criteria_type]
      end
    end
  end
end
