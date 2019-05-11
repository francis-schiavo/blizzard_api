# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class RaceTest < Minitest::Test
      def test_race_index
        race = BlizzardApi::Wow::Race.new
        race_data = race.index
        assert_equal 21, race_data[:races].count
      end

      def test_race_get
        race = BlizzardApi::Wow::Race.new
        race_data = race.get 6
        assert_equal 'Tauren', race_data[:name][:en_US]
      end

      def test_race_complete
        race = BlizzardApi::Wow::Race.new
        race_data = race.complete
        assert_equal 'Orc', race_data[1][:gender_name][:male_name][:en_US]
      end
    end
  end
end
