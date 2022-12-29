# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module OverwatchLeague
    class MatchesTest < Minitest::Test
      def setup
        @matches = BlizzardApi::OverwatchLeague.matches
      end

      def test_match
        summary = BlizzardApi::OverwatchLeague.summary.get
        match_id = summary[:matches].first[1][:id]

        data = @matches.get match_id
        assert data[:endTimestamp]
      end
    end
  end
end
