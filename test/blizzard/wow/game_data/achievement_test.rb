# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class AchievementTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.achievement
      end

      def test_achievement_index
        data = @endpoint.index
        assert data.key? :achievements
      end

      def test_achievement_get
        data = @endpoint.get 6
        assert_equal 'Level 10', data.dig(:name, :en_US)
      end

      def test_achievement_categories
        data = @endpoint.categories
        assert data.key?(:root_categories)
        assert data.key?(:categories)
        assert data.key?(:guild_categories)
      end

      def test_achievement_category
        data = @endpoint.category 81
        assert_equal 'Feats of Strength', data.dig(:name, :en_US)
        assert data.key?(:achievements)
      end

      def test_achievement_media
        data = @endpoint.media 6
        assert_equal 'https://render.worldofwarcraft.com/us/icons/56/achievement_level_10.jpg', data.dig(:assets, 0, :value)
      end
    end
  end
end
