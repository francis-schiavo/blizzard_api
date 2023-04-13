# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class ItemTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.item
      end

      def test_item_get
        data = @endpoint.get 35_000
        assert_equal 'Brutal Gladiator\'s Dragonhide Legguards', data.dig(:name, :en_US)

        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.get 21_877, classic: true
        assert_equal 'Netherweave Cloth', data.dig(:name, :en_US)
      end

      def test_item_set_index
        data = @endpoint.sets
        assert_equal 'Iceborne Embrace', data.dig(:item_sets, 0, :name, :en_US)
      end

      def test_item_set
        data = @endpoint.set 1
        assert_equal 'The Gladiator', data.dig(:name, :en_US)
      end

      def test_item_classes
        data = @endpoint.classes
        assert data[:item_classes]

        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.classes classic: true
        assert data[:item_classes]
      end

      def test_item_class
        data = @endpoint.item_class 1
        assert data[:item_subclasses]

        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.item_class 1, classic: true
        assert data[:item_subclasses]
      end

      def test_subclass
        data = @endpoint.subclass 1, 1
        assert_equal 'Soul Bag', data.dig(:display_name, :en_US)

        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.subclass 1, 1, classic: true
        assert_equal 'Soul Bag', data.dig(:display_name, :en_US)
      end

      def test_item_media
        data = @endpoint.media 35_000
        assert data.key? :assets

        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        data = @endpoint.media 25, classic: true
        assert data.key? :assets
      end

      def test_item_search
        data = @endpoint.search(1, 100) do |search_options|
          search_options.where 'name.en_US', 'Booterang'
          search_options.order_by 'id'
        end
        assert_equal 'Botarangue', data.dig(:results, 0, :data, :name, :pt_BR)
      end
    end
  end
end
