# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class AchievementCategoryTest < Minitest::Test
      def test_achievement_category_index
        achievement_category = BlizzardApi::Wow::AchievementCategory.new
        achievement_category_data = achievement_category.index
        assert_equal 110, achievement_category_data[:categories].count
      end

      def test_achievement_category_get
        achievement_category = BlizzardApi::Wow::AchievementCategory.new
        achievement_category_data = achievement_category.get 81
        assert_equal 'Feats of Strength', achievement_category_data[:name][:en_US]
      end

      def test_achievement_category_complete
        achievement_category = BlizzardApi::Wow::AchievementCategory.new
        achievement_category_data = achievement_category.complete
        assert_equal 148, achievement_category_data.count
      end
    end
  end
end
