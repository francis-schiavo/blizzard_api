# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PetTest < Minitest::Test
      def setup
        @pet = BlizzardApi::Wow::Pet.new
      end

      def test_pet_index
        pet_data = @pet.index
        assert_equal 1248, pet_data[:pets].count

        pet_data = @pet.index use_community_endpoint: true
        assert_equal 1244, pet_data[:pets].count
      end

      def test_pet_get
        pet_data = @pet.get 39
        assert_equal 'Mechanical Squirrel', pet_data[:name][:en_US]
      end

      def test_pet_ability
        pet_data = @pet.ability 640
        assert_equal 'spell_shadow_plaguecloud', pet_data[:icon]
      end

      def test_pet_species
        pet_data = @pet.species 258
        assert_equal 42_078, pet_data[:creatureId]
      end

      def test_pet_stats
        pet_data = @pet.stats 258, 25, 5, 4
        assert_equal 1587, pet_data[:health]
      end

      def test_pet_types
        pet_data = @pet.types
        assert_equal 10, pet_data[:petTypes].count
      end
    end
  end
end
