# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Starcraft
    class LeagueTest < Minitest::Test
      def test_league_get
        league = BlizzardApi::Starcraft::League.new
        league_data = league.get 37, 201, 0, 6
        assert league_data[:tier]
      end
    end
  end
end
