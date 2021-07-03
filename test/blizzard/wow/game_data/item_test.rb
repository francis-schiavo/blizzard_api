# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class ItemTest < Minitest::Test
      def setup
        @item = BlizzardApi::Wow.item
      end

      def test_item_get
        item_data = @item.get 35_000
        assert_equal 'Brutal Gladiator\'s Dragonhide Legguards', item_data[:name][:en_US]

        item_data = @item.get 25, classic1x: true
        assert_equal 'Worn Shortsword', item_data[:name][:en_US]

        item_data = @item.get 21877, classic: true
        assert_equal 'Netherweave Cloth', item_data[:name][:en_US]
      end

      def test_item_set_index
        item_data = @item.sets
        assert_equal 'The Gladiator', item_data[:item_sets][0][:name][:en_US]
      end

      def test_item_set
        item_data = @item.set 1
        assert_equal 'The Gladiator', item_data[:name][:en_US]
      end

      def test_item_classes
        item_data = @item.classes
        assert_equal 17, item_data[:item_classes].count

        item_data = @item.classes classic1x: true
        assert_equal 13, item_data[:item_classes].count

        item_data = @item.classes classic: true
        assert_equal 14, item_data[:item_classes].count
      end

      def test_item_class
        item_data = @item.class 1
        assert_equal 11, item_data[:item_subclasses].count

        item_data = @item.class 1, classic1x: true
        assert_equal 5, item_data[:item_subclasses].count

        item_data = @item.class 1, classic: true
        assert_equal 8, item_data[:item_subclasses].count
      end

      def test_subclass
        item_data = @item.subclass 1, 1
        assert_equal 'Soul Bag', item_data[:display_name][:en_US]

        item_data = @item.subclass 1, 1, classic1x: true
        assert_equal 'Soul Bag', item_data[:display_name][:en_US]

        item_data = @item.subclass 1, 1, classic: true
        assert_equal 'Soul Bag', item_data[:display_name][:en_US]
      end

      def test_item_media
        item_data = @item.media 35_000
        assert item_data.key? :assets

        item_data = @item.media 25, classic1x: true
        assert item_data.key? :assets

        item_data = @item.media 25, classic: true
        assert item_data.key? :assets
      end

      def test_item_search
        data = @item.search(1, 100) do |search_options|
          search_options.where 'name.en_US', 'Booterang'
          search_options.order_by 'id'
        end
        assert_equal 'Botarangue', data[:results][0][:data][:name][:pt_BR]
      end

      def test_extended_mode
        api_client = BlizzardApi::Wow::Item.new 'us', :extended
        response, item_data = api_client.get 35_000
        assert_equal '200', response.code
        assert_equal 'Brutal Gladiator\'s Dragonhide Legguards', item_data[:name][:en_US]
      end
    end
  end
end
