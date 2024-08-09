# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class ItemAppearanceTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.item_appearance
      end

      def test_item_appearance_get
        data = @endpoint.get 321
        assert_equal 'HEAD', data.dig(:slot, :type)
      end

      def test_item_appearance_set_index
        data = @endpoint.sets
        assert_equal "Wild Combatant's Chain Armor", data.dig(:appearance_sets, 0, :name, :en_US)
      end

      def test_item_appearance_set
        data = @endpoint.set 13
        assert_equal "Wild Combatant's Chain Armor", data.dig(:set_name, :en_US)
      end

      def test_item_appearance_slots
        data = @endpoint.slots
        assert data[:slots]
      end

      def test_item_appearance_slot
        data = @endpoint.slot 'HEAD'
        assert_equal 321, data.dig(:appearances, 0, :id)
      end

      def test_item_appearance_search
        data = @endpoint.search(1, 100) do |search_options|
          search_options.where 'slot.type', 'HEAD'
          search_options.order_by 'id'
        end
        assert_equal 'Head', data.dig(:results, 0, :data, :slot, :name, :en_US)
      end
    end
  end
end
