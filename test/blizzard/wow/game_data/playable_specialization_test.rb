# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PlayableSpecializationTest < Minitest::Test
      def test_specialization_index
        specs = BlizzardApi::Wow::PlayableSpecialization.new
        specs_data = specs.index
        assert_equal 62, specs_data[:character_specializations][0][:id]
      end

      def test_specialization_get
        specs = BlizzardApi::Wow::PlayableSpecialization.new
        specs_data = specs.get 62
        assert_equal 'Arcane', specs_data[:name][:en_US]
      end

      def test_specialization_complete
        specs = BlizzardApi::Wow::PlayableSpecialization.new
        specs_data = specs.complete
        assert_equal 'Ferocity', specs_data[:pet_specializations][0][:name][:en_US]
      end
    end
  end
end
