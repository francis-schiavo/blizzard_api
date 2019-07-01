# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class CreatureTest < Minitest::Test
      def setup
        @mythic_keystone_leaderboard = BlizzardApi::Wow::Creature.new
      end

      def test_creature_get
        creature_data = @mythic_keystone_leaderboard.get 42_722
        assert_equal 'Young Mastiff', creature_data[:name][:en_US]
      end

      def test_creature_families
        creature_families_data = @mythic_keystone_leaderboard.families
        assert_equal 78, creature_families_data[:creature_families].count
      end

      def test_creature_family
        creature_family_data = @mythic_keystone_leaderboard.family 1
        assert_equal 'Wolf', creature_family_data[:name][:en_US]
      end

      def test_creature_family_media
        creature_family_media_data = @mythic_keystone_leaderboard.family_media 1
        assert_equal 'https://render-us.worldofwarcraft.com/icons/56/ability_hunter_pet_wolf.jpg',
                     creature_family_media_data[:assets][0][:value]
      end

      def test_creature_types
        creature_types_data = @mythic_keystone_leaderboard.types
        assert_equal 15, creature_types_data[:creature_types].count
      end

      def test_creature_type
        creature_type_data = @mythic_keystone_leaderboard.type 1
        assert_equal 'Beast', creature_type_data[:name][:en_US]
      end

      def test_creature_display_media
        creature_display_media_data = @mythic_keystone_leaderboard.display_media 30_221
        assert_equal 'https://render-us.worldofwarcraft.com/npcs/portrait/creature-display-30221.jpg',
                     creature_display_media_data[:assets][0][:value]
      end
    end
  end
end
