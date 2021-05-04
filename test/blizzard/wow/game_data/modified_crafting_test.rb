# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class ModifiedCraftingTest < Minitest::Test
      def setup
        @modified_crafting = BlizzardApi::Wow.modified_crafting
      end

      def test_modified_crafting_index
        data = @modified_crafting.index
        assert data.key?(:categories)
        assert data.key?(:slot_types)
      end

      def test_modified_crafting_categories
        data = @modified_crafting.categories
        assert data.key?(:categories)
      end

      def test_modified_crafting_category
        data = @modified_crafting.category 1
        assert_equal 'Specify Haste', data[:name][:en_US]
      end

      def test_modified_crafting_slot_types
        data = @modified_crafting.slot_types
        assert data.key?(:slot_types)
      end

      def test_modified_crafting_slot_type
        data = @modified_crafting.slot_type 16
        assert_equal 'Set Item Level', data[:description][:en_US]
      end
    end
  end
end
