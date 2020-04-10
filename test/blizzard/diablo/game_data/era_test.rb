# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Diablo
    class EraTest < Minitest::Test
      def setup
        @era = BlizzardApi::Diablo.era
      end

      def test_era_index
        era_data = @era.index
        assert era_data[:era]
      end

      def test_era_get
        era_data = @era.get 1
        assert era_data[:leaderboard]
      end

      def test_era_leaderboard
        era_data = @era.leaderboard 1, 'rift-barbarian'
        assert era_data[:row]
      end
    end
  end
end
