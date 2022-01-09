# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PlayableRaceTest < Minitest::Test
      def setup
        @race = BlizzardApi::Wow.playable_race
      end

      def test_playable_race_index
        race_data = @race.index
        assert_equal 25, race_data[:races].count
      end

      def test_playable_race_get
        race_data = @race.get 6
        assert_equal 'Tauren', race_data[:name][:en_US]
      end
    end
  end
end
