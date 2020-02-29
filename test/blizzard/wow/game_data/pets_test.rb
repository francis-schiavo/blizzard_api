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
        assert_equal 1280, pet_data[:pets].count
      end

      def test_pet_get
        pet_data = @pet.get 39
        assert_equal 'Mechanical Squirrel', pet_data[:name][:en_US]
      end
    end
  end
end
