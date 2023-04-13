# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class ModifiedCraftingTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.modified_crafting
      end

      def test_modified_crafting_index
        data = @endpoint.index
        assert data.key?(:categories)
        assert data.key?(:slot_types)
      end

      def test_modified_crafting_categories
        data = @endpoint.categories
        assert data.key?(:categories)
      end

      def test_modified_crafting_category
        data = @endpoint.category 1
        assert_equal 'Specify Haste', data.dig(:name, :en_US)
      end

      def test_modified_crafting_slot_types
        data = @endpoint.slot_types
        assert data.key?(:slot_types)
      end

      def test_modified_crafting_slot_type
        data = @endpoint.slot_type 16
        assert_equal 'Modify Item Level - Major', data.dig(:description, :en_US)
      end
    end
  end
end
