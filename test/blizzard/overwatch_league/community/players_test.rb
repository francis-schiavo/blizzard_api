# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module OverwatchLeague
    class PlayersTest < Minitest::Test
      def setup
        @players = BlizzardApi::OverwatchLeague.players
      end

      def test_summary
        summary = BlizzardApi::OverwatchLeague.summary.get
        player_id = summary[:players].first[1][:id]

        data = @players.get player_id
        assert data[:givenName]
      end
    end
  end
end
