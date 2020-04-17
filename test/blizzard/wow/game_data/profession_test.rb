# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class ProfessionTest < Minitest::Test
      def setup
        @profession = BlizzardApi::Wow.profession
      end

      def test_profession_index
        profession_data = @profession.index
        assert_equal 14, profession_data[:professions].count
      end

      def test_profession_get
        profession_data = @profession.get 164
        assert_equal 'Blacksmithing', profession_data[:name][:en_US]
      end

      def test_profession_media
        profession_data = @profession.media 164
        assert_equal 'https://render-us.worldofwarcraft.com/icons/56/trade_blacksmithing.jpg', profession_data[:assets][0][:value]
      end

      def test_profession_tier
        profession_data = @profession.skill_tier 164, 2477
        assert_equal 300, profession_data[:maximum_skill_level]
      end

      def test_recipe
        recipe_data = @profession.recipe 1631
        assert_equal 'Rough Sharpening Stone', recipe_data[:name][:en_US]
      end

      def test_recipe_media
        recipe_data = @profession.recipe_media 1631
        assert_equal 'https://render-us.worldofwarcraft.com/icons/56/inv_stone_sharpeningstone_01.jpg', recipe_data[:assets][0][:value]
      end
    end
  end
end
