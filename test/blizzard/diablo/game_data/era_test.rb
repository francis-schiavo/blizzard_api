# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Diablo
    class EraTest < Minitest::Test
      def test_era_index
        era = BlizzardApi::Diablo::Era.new
        era_data = era.index
        assert era_data[:era]
      end

      def test_era_get
        era = BlizzardApi::Diablo::Era.new
        era_data = era.get 1
        assert era_data[:leaderboard]
      end

      def test_era_leaderboard
        era = BlizzardApi::Diablo::Era.new
        era_data = era.leaderboard 1, 'rift-barbarian'
        assert era_data[:row]
      end
    end
  end
end
