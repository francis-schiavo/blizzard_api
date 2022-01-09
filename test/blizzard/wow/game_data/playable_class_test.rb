# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PlayableClassTest < Minitest::Test
      def setup
        @playable_class = BlizzardApi::Wow.playable_class
      end

      def test_playable_class_index
        data = @playable_class.index
        assert_equal 12, data[:classes].count

        data = @playable_class.index classic: true
        assert_equal 9, data[:classes].count
      end

      def test_playable_class_get
        data = @playable_class.get 11
        assert_equal 'Druid', data[:name][:en_US]

        data = @playable_class.get 11, classic: true
        assert_equal 'Druid', data[:name][:en_US]
      end

      def test_playable_class_talent_slots
        data = @playable_class.talent_slots 11
        assert_equal 10, data[:talent_slots][0][:unlock_player_level]
      end

      def test_playable_class_media
        data = @playable_class.media 11
        assert_equal 'https://render-us.worldofwarcraft.com/icons/56/classicon_druid.jpg', data[:assets][0][:value]
      end
    end
  end
end
