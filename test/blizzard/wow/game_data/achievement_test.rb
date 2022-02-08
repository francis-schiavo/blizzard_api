# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class AchievementTest < Minitest::Test
      def setup
        @power_types = BlizzardApi::Wow.achievement
      end

      def test_achievement_index
        achievement_data = @power_types.index
        assert achievement_data.key? :achievements
      end

      def test_achievement_get
        achievement_data = @power_types.get 6
        assert_equal 'Level 10', achievement_data[:name][:en_US]
      end

      def test_achievement_categories
        achievement_categories_data = @power_types.categories
        assert achievement_categories_data.key?(:root_categories)
        assert achievement_categories_data.key?(:categories)
        assert achievement_categories_data.key?(:guild_categories)
      end

      def test_achievement_category
        achievement_categories_data = @power_types.category 81
        assert_equal 'Feats of Strength', achievement_categories_data[:name][:en_US]
        assert achievement_categories_data.key?(:achievements)
      end

      def test_achievement_media
        achievement_media_data = @power_types.media 6
        assert_equal 'https://render-us.worldofwarcraft.com/icons/56/achievement_level_10.jpg',
                     achievement_media_data[:assets][0][:value]
      end
    end
  end
end
