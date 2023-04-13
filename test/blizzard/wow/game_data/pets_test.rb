# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PetTest < Minitest::Test
      def setup
        @data = BlizzardApi::Wow.pet
      end

      def test_pet_index
        data = @data.index
        assert data.key? :pets
      end

      def test_pet_get
        data = @data.get 39
        assert_equal 'Mechanical Squirrel', data.dig(:name, :en_US)
      end

      def test_pet_media
        data = @data.media 39
        assert_equal 'https://render.worldofwarcraft.com/us/icons/56/inv_pet_mechanicalsquirrel.jpg', data.dig(:assets, 0, :value)
      end

      def test_pet_ability_index
        data = @data.abilities
        assert data.key? :abilities
      end

      def test_pet_ability_get
        data = @data.ability 110
        assert_equal 'Bite', data.dig(:name, :en_US)
      end

      def test_pet_ability_media
        data = @data.ability_media 110
        assert_equal 'https://render.worldofwarcraft.com/us/icons/56/ability_druid_ferociousbite.jpg', data.dig(:assets, 0, :value)
      end
    end
  end
end
