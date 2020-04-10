# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Starcraft
    class LadderTest < Minitest::Test
      def setup
        @ladder = BlizzardApi::Starcraft.ladder
      end

      def test_ladder_grandmaster
        ladder_data = @ladder.grandmaster :US
        assert ladder_data[:ladderTeams]
      end

      def test_ladder_season
        ladder_data = @ladder.season :US
        assert ladder_data[:year]
      end
    end
  end
end
