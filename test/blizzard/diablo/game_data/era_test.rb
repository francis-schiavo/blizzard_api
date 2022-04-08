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
        assert era_data.key? :era
      end

      def test_era_get
        era_data = @era.get 1
        assert era_data.key? :leaderboard
      end

      def test_era_leaderboard
        era_data = @era.leaderboard 1, 'rift-barbarian'
        assert era_data.key? :row
      end
    end
  end
end
