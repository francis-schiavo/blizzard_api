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
        assert race_data.key? :races

        race_data = @race.index classic: true
        assert race_data.key? :races
      end

      def test_playable_race_get
        race_data = @race.get 6
        assert_equal 'Tauren', race_data[:name][:en_US]

        race_data = @race.get 6, classic: true
        assert_equal 'Tauren', race_data[:name][:en_US]
      end
    end
  end
end
