# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module OverwatchLeague
    class TeamsTest < Minitest::Test
      def setup
        @teams = BlizzardApi::OverwatchLeague.teams
      end

      def test_team
        summary = BlizzardApi::OverwatchLeague.summary.get
        team_id = summary[:teams].first[1][:id]

        data = @teams.get team_id
        assert data[:roster]
      end
    end
  end
end
