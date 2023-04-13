# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PlayableRaceTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.playable_race
      end

      def test_playable_race_index
        data = @endpoint.index
        assert data.key? :races

        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.index classic: true
        assert data.key? :races
      end

      def test_playable_race_get
        data = @endpoint.get 6
        assert_equal 'Tauren', data.dig(:name, :en_US)

        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.get 6, classic: true
        assert_equal 'Tauren', data.dig(:name, :en_US)
      end
    end
  end
end
