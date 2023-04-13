# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class QuestTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.quest
      end

      def test_quest_index
        data = @endpoint.index
        assert data.key? :categories
        assert data.key? :areas
        assert data.key? :types
      end

      def test_quest_get
        data = @endpoint.get 2
        assert_equal 'Sharptalon\'s Claw', data.dig(:title, :en_US)
      end

      def test_quest_categories
        data = @endpoint.categories
        assert data.key? :categories
      end

      def test_quest_category
        data = @endpoint.category 1
        assert_equal 'Epic', data.dig(:category, :en_US)
      end

      def test_quest_types
        data = @endpoint.types
        assert data.key? :types
      end

      def test_quest_type
        data = @endpoint.type 1
        assert_equal 'Group', data.dig(:type, :en_US)
      end

      def test_quest_areas
        data = @endpoint.areas
        assert data.key? :areas
      end

      def test_quest_area
        data = @endpoint.area 215
        assert_equal 'Mulgore', data.dig(:area, :en_US)
      end
    end
  end
end
