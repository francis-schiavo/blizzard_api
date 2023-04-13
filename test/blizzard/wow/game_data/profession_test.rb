# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class ProfessionTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.profession
      end

      def test_profession_index
        data = @endpoint.index
        assert data.key? :professions
      end

      def test_profession_get
        data = @endpoint.get 164
        assert_equal 'Blacksmithing', data.dig(:name, :en_US)
      end

      def test_profession_media
        data = @endpoint.media 164
        assert_equal 'https://render.worldofwarcraft.com/us/icons/56/ui_profession_blacksmithing.jpg', data.dig(:assets, 0, :value)
      end

      def test_profession_tier
        data = @endpoint.skill_tier 164, 2477
        assert_equal 300, data[:maximum_skill_level]
      end

      def test_recipe
        data = @endpoint.recipe 1631
        assert_equal 'Rough Sharpening Stone', data.dig(:name, :en_US)
      end

      def test_recipe_media
        data = @endpoint.recipe_media 1631
        assert_equal 'https://render.worldofwarcraft.com/us/icons/56/inv_stone_sharpeningstone_01.jpg', data.dig(:assets, 0, :value)
      end
    end
  end
end
