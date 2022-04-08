# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class CreatureTest < Minitest::Test
      def setup
        @creature = BlizzardApi::Wow.creature
      end

      def test_creature_get
        creature_data = @creature.get 42_722
        assert_equal 'Young Mastiff', creature_data[:name][:en_US]

        creature_data = @creature.get 107, classic: true
        assert_equal 'Raptor', creature_data[:name][:en_US]
      end

      def test_creature_families
        creature_families_data = @creature.families
        assert creature_families_data.key? :creature_families

        creature_families_data = @creature.families classic: true
        assert creature_families_data.key? :creature_families
      end

      def test_creature_family
        creature_family_data = @creature.family 1
        assert_equal 'Wolf', creature_family_data[:name][:en_US]

        creature_family_data = @creature.family 1, classic: true
        assert_equal 'Wolf', creature_family_data[:name][:en_US]
      end

      def test_creature_family_media
        creature_family_media_data = @creature.family_media 1
        assert_equal 'https://render.worldofwarcraft.com/us/icons/56/ability_hunter_pet_wolf.jpg',
                     creature_family_media_data[:assets][0][:value]

        creature_family_media_data = @creature.family_media 1, classic: true
        assert_equal 'https://render.worldofwarcraft.com/classic-us/icons/56/ability_hunter_pet_wolf.jpg',
                     creature_family_media_data[:assets][0][:value]
      end

      def test_creature_types
        creature_types_data = @creature.types
        assert_equal 15, creature_types_data[:creature_types].count

        creature_types_data = @creature.types classic: true
        assert_equal 13, creature_types_data[:creature_types].count
      end

      def test_creature_type
        creature_type_data = @creature.type 1
        assert_equal 'Beast', creature_type_data[:name][:en_US]

        creature_type_data = @creature.type 1, classic: true
        assert_equal 'Beast', creature_type_data[:name][:en_US]
      end

      def test_creature_display_media
        creature_display_media_data = @creature.display_media 30_221
        assert_equal 'https://render.worldofwarcraft.com/us/npcs/zoom/creature-display-30221.jpg',
                     creature_display_media_data[:assets][0][:value]

        creature_display_media_data = @creature.display_media 180, classic: true
        assert_equal 'https://render.worldofwarcraft.com/classic-us/npcs/zoom/creature-display-180.jpg',
                     creature_display_media_data[:assets][0][:value]
      end

      def test_creature_search
        data = @creature.search(1, 100) do |search_options|
          search_options.where 'name.en_US', 'Dragon'
          search_options.order_by 'id'
        end
        assert_equal 'Pequeno Dragão Verde', data[:results][0][:data][:name][:pt_BR]
      end
    end
  end
end
