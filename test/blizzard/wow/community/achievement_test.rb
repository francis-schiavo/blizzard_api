# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class AchievementTest < Minitest::Test
      def test_achievement_get
        achievement = BlizzardApi::Wow::Achievement.new
        achievement_data = achievement.get 2144
        assert_equal 50, achievement_data[:points]
      end

      def test_character_achievement_index
        achievement = BlizzardApi::Wow::Achievement.new
        achievement_data = achievement.character_achievement_index
        assert_equal 92, achievement_data[:achievements][0][:id]
      end

      def test_guild_achievement_index
        achievement = BlizzardApi::Wow::Achievement.new
        achievement_data = achievement.guild_achievement_index
        assert_equal 15_088, achievement_data[:achievements][0][:id]
      end
    end
  end
end
