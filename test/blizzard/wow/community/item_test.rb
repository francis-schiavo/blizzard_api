# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class ItemTest < Minitest::Test
      def test_item_get
        item = BlizzardApi::Wow::Item.new
        item_data = item.get 18_803
        assert_equal 'inv_gizmo_02', item_data[:icon]
      end

      def test_item_set
        item = BlizzardApi::Wow::Item.new
        item_data = item.item_set 1060
        assert_equal 76_749, item_data[:items][0]
      end

      def test_item_classes
        item = BlizzardApi::Wow::Item.new
        item_data = item.classes
        assert item_data[:classes]
      end
    end
  end
end
