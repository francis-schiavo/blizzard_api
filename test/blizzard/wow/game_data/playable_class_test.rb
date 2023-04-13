# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PlayableClassTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.playable_class
      end

      def test_playable_class_index
        data = @endpoint.index
        assert data[:classes]

        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.index classic: true
        assert data[:classes]
      end

      def test_playable_class_get
        data = @endpoint.get 11
        assert_equal 'Druid', data.dig(:name, :en_US)

        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.get 11, classic: true
        assert_equal 'Druid', data.dig(:name, :en_US)
      end

      def test_playable_class_talent_slots
        data = @endpoint.talent_slots 11
        assert_equal 10, data.dig(:talent_slots, 0, :unlock_player_level)
      end

      def test_playable_class_media
        data = @endpoint.media 11
        assert_equal 'https://render.worldofwarcraft.com/us/icons/56/classicon_druid.jpg', data.dig(:assets, 0, :value)
      end
    end
  end
end
