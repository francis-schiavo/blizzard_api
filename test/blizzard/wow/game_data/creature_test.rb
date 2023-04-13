# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class CreatureTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.creature
      end

      def test_creature_get
        data = @endpoint.get 42_722
        assert_equal 'Young Mastiff', data.dig(:name, :en_US)

        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.get 107, classic: true
        assert_equal 'Raptor', data.dig(:name, :en_US)
      end

      def test_creature_families
        data = @endpoint.families
        assert data.key? :creature_families

        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.families classic: true
        assert data.key? :creature_families
      end

      def test_creature_family
        data = @endpoint.family 1
        assert_equal 'Wolf', data.dig(:name, :en_US)

        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.family 1, classic: true
        assert_equal 'Wolf', data.dig(:name, :en_US)
      end

      def test_creature_family_media
        data = @endpoint.family_media 1
        assert_equal 'https://render.worldofwarcraft.com/us/icons/56/ability_hunter_pet_wolf.jpg',
                     data.dig(:assets, 0, :value)

        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.family_media 1, classic: true
        assert_equal 'https://render.worldofwarcraft.com/classic-us/icons/56/ability_hunter_pet_wolf.jpg',
                     data.dig(:assets, 0, :value)
      end

      def test_creature_types
        data = @endpoint.types
        assert_equal 15, data[:creature_types].count

        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.types classic: true
        assert_equal 13, data[:creature_types].count
      end

      def test_creature_type
        data = @endpoint.type 1
        assert_equal 'Beast', data.dig(:name, :en_US)

        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.type 1, classic: true
        assert_equal 'Beast', data.dig(:name, :en_US)
      end

      def test_creature_display_media
        data = @endpoint.display_media 30_221
        assert_equal 'https://render.worldofwarcraft.com/us/npcs/zoom/creature-display-30221.jpg',
                     data.dig(:assets, 0, :value)

        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.display_media 180, classic: true
        assert_equal 'https://render.worldofwarcraft.com/classic-us/npcs/zoom/creature-display-180.jpg',
                     data.dig(:assets, 0, :value)
      end

      def test_creature_search
        data = @endpoint.search(1, 100) do |search_options|
          search_options.where 'name.en_US', 'Dragon'
          search_options.order_by 'id'
        end
        assert_equal 'Dragonete Cintilante', data.dig(:results, 0, :data, :name, :pt_BR)
      end
    end
  end
end
