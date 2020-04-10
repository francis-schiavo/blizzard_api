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
      end

      def test_quest_get
        quest_data = @quest.get 2
        assert_equal 'Sharptalon\'s Claw', quest_data[:title][:en_US]
      end

      def test_quest_categories
        quest_data = @quest.categories
        assert 122, quest_data[:categories].count
      end

      def test_quest_category
        quest_data = @quest.category 1
        assert 'Epic', quest_data[:category][:en_US]
      end

      def test_quest_types
        quest_data = @quest.types
        assert 10, quest_data[:types].count
      end

      def test_quest_type
        quest_data = @quest.type 1
        assert 'Group', quest_data[:type][:en_US]
      end

      def test_quest_areas
        quest_data = @quest.areas
        assert 321, quest_data[:areas].count
      end

      def test_quest_area
        quest_data = @quest.area 215
        assert 'Mulgore', quest_data[:area][:en_US]
      end
    end
  end
end
