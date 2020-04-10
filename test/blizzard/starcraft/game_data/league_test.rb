# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Starcraft
    class LeagueTest < Minitest::Test
      def setup
        @league = BlizzardApi::Starcraft.league
      end

      def test_league_get
        league_data = @league.get 37, 201, 0, 6
        assert league_data[:tier]
      end
    end
  end
end
