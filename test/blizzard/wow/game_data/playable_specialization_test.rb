# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PlayableSpecializationTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.playable_specialization
      end

      def test_specialization_index
        data = @endpoint.index
        assert data.key? :character_specializations
      end

      def test_specialization_get
        data = @endpoint.get 62
        assert_equal 'Arcane', data.dig(:name, :en_US)
      end

      def test_specialization_media
        data = @endpoint.media 262
        assert_equal 'https://render.worldofwarcraft.com/us/icons/56/spell_nature_lightning.jpg', data.dig(:assets, 0, :value)
      end
    end
  end
end
