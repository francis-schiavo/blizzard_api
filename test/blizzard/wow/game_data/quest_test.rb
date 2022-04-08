# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class QuestTest < Minitest::Test
      def setup
        @quest = BlizzardApi::Wow.quest
      end

      def test_quest_index
        quest_data = @quest.index
        assert quest_data.key? :categories
        assert quest_data.key? :areas
        assert quest_data.key? :types
      end

      def test_quest_get
        quest_data = @quest.get 2
        assert_equal 'Sharptalon\'s Claw', quest_data[:title][:en_US]
      end

      def test_quest_categories
        quest_data = @quest.categories
        assert quest_data.key? :categories
      end

      def test_quest_category
        quest_data = @quest.category 1
        assert_equal 'Epic', quest_data[:category][:en_US]
      end

      def test_quest_types
        quest_data = @quest.types
        assert quest_data.key? :types
      end

      def test_quest_type
        quest_data = @quest.type 1
        assert_equal 'Group', quest_data[:type][:en_US]
      end

      def test_quest_areas
        quest_data = @quest.areas
        assert quest_data.key? :areas
      end

      def test_quest_area
        quest_data = @quest.area 215
        assert_equal 'Mulgore', quest_data[:area][:en_US]
      end
    end
  end
end
