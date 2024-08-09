# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class CharacterTest < Minitest::Test
      def setup
        @character = BlizzardApi::Wow.character_profile
      end

      def test_character_get
        character_data = @character.get 'Azralon', 'Schiller'
        assert_equal 147_161_356, character_data[:id]
      end

      def test_character_achievements
        character_data = @character.achievements 'Azralon', 'Schiller'
        assert character_data.key? :total_quantity
      end

      def test_character_achievement_statistics
        character_data = @character.achievement_statistics 'Azralon', 'Schiller'
        assert character_data.key? :categories
      end

      def test_character_appearance
        character_data = @character.appearance 'Azralon', 'Schiller'
        assert character_data.key? :customizations
      end

      def test_character_collections
        character_data = @character.collections 'Azralon', 'Schiller'
        assert character_data.key? :pets
        assert character_data.key? :mounts
      end

      def test_character_mounts
        character_data = @character.mounts 'Azralon', 'Schiller'
        assert character_data.key? :mounts
      end

      def test_character_pets
        character_data = @character.pets 'Azralon', 'Schiller'
        assert character_data.key? :pets
      end

      def test_character_encounters
        character_data = @character.encounters 'Azralon', 'Schiller'
        assert character_data.key? :dungeons
        assert character_data.key? :raids
      end

      def test_character_dungeons
        character_data = @character.dungeons 'Azralon', 'Schiller'
        assert character_data.key? :expansions
      end

      def test_character_raids
        character_data = @character.raids 'Azralon', 'Schiller'
        assert character_data.key? :expansions
      end

      def test_character_equipment
        character_data = @character.equipment 'Azralon', 'Schiller'
        assert character_data.key? :equipped_items
      end

      def test_character_media
        character_data = @character.media 'Azralon', 'Schiller'
        assert character_data[:assets].map { |item| item[:key] }.include?('avatar')
      end

      def test_character_pvp_summary
        character_data = @character.pvp_summary 'Azralon', 'Schiller'
        assert character_data.key? :honorable_kills
      end

      def test_character_quest
        character_data = @character.quests 'Azralon', 'Schiller'
        assert character_data.key? :in_progress

        character_data = @character.quests 'Azralon', 'Schiller', completed: true
        assert character_data.key? :quests
      end

      def test_character_specializations
        character_data = @character.specializations 'Azralon', 'Schiller'
        assert character_data.key? :specializations
      end

      def test_character_statistics
        character_data = @character.statistics 'Azralon', 'Schiller'
        assert character_data.key? :power_type
      end

      def test_character_titles
        character_data = @character.titles 'Azralon', 'Schiller'
        assert character_data[:active_title][:name][:en_US]
      end

      def test_character_transmogs
        character_data = @character.titles 'Azralon', 'Schiller'
        assert 13, character_data.dig(:appearance_sets, 0, :id)
      end

      def test_character_mythic_keystone_profile
        character_data = @character.mythic_keystone_profile 'Azralon', 'Schiller'
        assert character_data.key? :current_period
      end

      def test_character_mythic_keystone_seasons
        character_data = @character.mythic_keystone_seasons 'Azralon', 'Schiller', 2
        assert character_data.key? :best_runs
      end
    end
  end
end
