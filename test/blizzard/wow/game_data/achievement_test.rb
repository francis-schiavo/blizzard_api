# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class AchievementTest < Minitest::Test
      def setup
        @achievement = BlizzardApi::Wow.achievement
      end

      def test_achievement_index
        achievement_data = @achievement.index
        assert achievement_data.key? :achievements
      end

      def test_achievement_get
        achievement_data = @achievement.get 6
        assert_equal 'Level 10', achievement_data[:name][:en_US]
      end

      def test_achievement_categories
        achievement_categories_data = @achievement.categories
        assert achievement_categories_data.key?(:root_categories)
        assert achievement_categories_data.key?(:categories)
        assert achievement_categories_data.key?(:guild_categories)
      end

      def test_achievement_category
        achievement_categories_data = @achievement.category 81
        assert_equal 'Feats of Strength', achievement_categories_data[:name][:en_US]
        assert achievement_categories_data.key?(:achievements)
      end

      def test_achievement_media
        achievement_media_data = @achievement.media 6
        assert_equal 'https://render.worldofwarcraft.com/us/icons/56/achievement_level_10.jpg',
                     achievement_media_data[:assets][0][:value]
      end
    end
  end
end
