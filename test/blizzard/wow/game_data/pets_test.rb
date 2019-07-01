# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PetTest < Minitest::Test
      def setup
        @pvp = BlizzardApi::Wow::Pet.new
      end

      def test_pet_index
        pet_data = @pvp.index
        assert_equal 1238, pet_data[:pets].count

        pet_data = @pvp.index use_community_endpoint: true
        assert_equal 1238, pet_data[:pets].count
      end

      def test_pet_get
        pet_data = @pvp.get 39
        assert_equal 'Mechanical Squirrel', pet_data[:name][:en_US]
      end

      def test_pet_ability
        pet_data = @pvp.ability 640
        assert_equal 'spell_shadow_plaguecloud', pet_data[:icon]
      end

      def test_pet_species
        pet_data = @pvp.species 258
        assert_equal 42_078, pet_data[:creatureId]
      end

      def test_pet_stats
        pet_data = @pvp.stats 258, 25, 5, 4
        assert_equal 1587, pet_data[:health]
      end

      def test_pet_types
        pet_data = @pvp.types
        assert_equal 10, pet_data[:petTypes].count
      end
    end
  end
end
