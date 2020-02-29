# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class AchievementTest < Minitest::Test
      def test_achievement_index
        achievement = BlizzardApi::Wow::Achievement.new
        achievement_data = achievement.index
        assert_equal 5131, achievement_data[:achievements].count
      end

      def test_achievement_get
        achievement = BlizzardApi::Wow::Achievement.new
        achievement_data = achievement.get 6
        assert_equal 'Level 10', achievement_data[:name][:en_US]
      end

      def test_achievement_complete
        assert_raises BlizzardApi::ApiException do
          achievement = BlizzardApi::Wow::Achievement.new
          achievement.complete
        end
      end

      def test_achievement_categories
        achievement = BlizzardApi::Wow::Achievement.new
        achievement_categories_data = achievement.categories
        assert_equal 14, achievement_categories_data[:root_categories].count
        assert_equal 115, achievement_categories_data[:categories].count
        assert_equal 24, achievement_categories_data[:guild_categories].count
      end

      def test_achievement_category
        achievement = BlizzardApi::Wow::Achievement.new
        achievement_categories_data = achievement.category 81
        assert_equal 'Feats of Strength', achievement_categories_data[:name][:en_US]
        assert_equal 109, achievement_categories_data[:achievements].count
      end

      def test_achievement_media
        achievement = BlizzardApi::Wow::Achievement.new
        achievement_media_data = achievement.media 6
        assert_equal 'https://render-us.worldofwarcraft.com/icons/56/achievement_level_10.jpg',
                     achievement_media_data[:assets][0][:value]
      end
    end
  end
end
