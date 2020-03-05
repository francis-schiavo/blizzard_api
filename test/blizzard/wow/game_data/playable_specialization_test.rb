# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PlayableSpecializationTest < Minitest::Test
      def setup
        @playable_specialization = BlizzardApi::Wow::PlayableSpecialization.new
      end
      def test_specialization_index
        specs_data = @playable_specialization.index
        assert_equal 62, specs_data[:character_specializations][0][:id]
      end

      def test_specialization_get
        specs_data = @playable_specialization.get 62
        assert_equal 'Arcane', specs_data[:name][:en_US]
      end

      def test_specialization_complete
        specs_data = @playable_specialization.complete
        assert_equal 'Ferocity', specs_data[:pet_specializations][0][:name][:en_US]
      end

      def test_specialization_media
        specs_data = @playable_specialization.media 262
        assert_equal 'https://render-us.worldofwarcraft.com/icons/56/spell_nature_lightning.jpg', specs_data[:assets][0][:value]
      end
    end
  end
end
