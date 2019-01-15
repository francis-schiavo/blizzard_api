# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PetTest < Minitest::Test
      def test_pet_index
        pet = BlizzardApi::Wow::Pet.new
        pet_data = pet.index
        assert pet_data[:pets]
      end

      def test_pet_ability
        pet = BlizzardApi::Wow::Pet.new
        pet_data = pet.ability 640
        assert_equal 'spell_shadow_plaguecloud', pet_data[:icon]
      end

      def test_pet_species
        pet = BlizzardApi::Wow::Pet.new
        pet_data = pet.species 258
        assert_equal 42_078, pet_data[:creatureId]
      end

      def test_pet_stats
        pet = BlizzardApi::Wow::Pet.new
        pet_data = pet.stats 258, 25, 5, 4
        assert_equal 1587, pet_data[:health]
      end

      def test_pet_types
        pet = BlizzardApi::Wow::Pet.new
        pet_data = pet.types
        assert pet_data[:petTypes]
      end
    end
  end
end
