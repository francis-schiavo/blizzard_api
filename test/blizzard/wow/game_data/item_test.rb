# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class ItemTest < Minitest::Test
      def setup
        @item = BlizzardApi::Wow::Item.new
      end

      def test_item_get
        item_data = @item.get 35_000
        assert_equal 'Brutal Gladiator\'s Dragonhide Legguards', item_data[:name][:en_US]

        item_data = @item.get 18_803, use_community_endpoint: true
        assert_equal 'inv_gizmo_02', item_data[:icon]
      end

      def test_item_set
        item_data = @item.item_set 1060
        assert_equal 76_749, item_data[:items][0]
      end

      def test_item_classes
        item_data = @item.classes
        assert_equal 17, item_data[:item_classes].count

        item_data = @item.classes use_community_endpoint: true
        assert_equal 16, item_data[:classes].count
      end

      def test_item_class
        item_data = @item.class 1
        assert_equal 11, item_data[:item_subclasses].count
      end

      def test_subclass
        item_data = @item.subclass 1, 1
        assert_equal 'Soul Bag', item_data[:display_name][:en_US]
      end

      def test_item_media
        item_data = @item.media 35_000
        assert item_data.key? :assets
      end
    end
  end
end
