# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PlayableClassTest < Minitest::Test
      def test_playable_class_index
        classes = BlizzardApi::Wow::PlayableClass.new
        classes_data = classes.index
        assert_equal 12, classes_data[:classes].count

        classes_data = classes.index classic: true
        assert_equal 9, classes_data[:classes].count
      end

      def test_playable_class_get
        playable_class = BlizzardApi::Wow::PlayableClass.new
        playable_class_data = playable_class.get 11
        assert_equal 'Druid', playable_class_data[:name][:en_US]

        playable_class_data = playable_class.get 11, classic: true
        assert_equal 'Druid', playable_class_data[:name][:en_US]
      end

      def test_playable_class_complete
        playable_class = BlizzardApi::Wow::PlayableClass.new
        playable_class_data = playable_class.complete
        assert_equal 'Warrior', playable_class_data[0][:name][:en_US]

        playable_class_data = playable_class.complete classic: true
        assert_equal 'Warrior', playable_class_data[0][:name][:en_US]
      end

      def test_class_talent_slots
        playable_class = BlizzardApi::Wow::PlayableClass.new
        talent_slots_data = playable_class.talent_slots 11
        assert_equal 20, talent_slots_data[:talent_slots][0][:unlock_player_level]
      end
    end
  end
end
