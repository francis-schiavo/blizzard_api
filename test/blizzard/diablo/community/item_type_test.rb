# frozen_string_literal: true

# frozen_string_lititemTypel: true

require 'test_helper'

module BlizzardApi
  module Diablo
    class ItemTypeTest < Minitest::Test
      def setup
        @item_type = BlizzardApi::Diablo.item_type
      end

      def test_item_type_index
        item_type_data = @item_type.index
        assert item_type_data.is_a? Array
      end

      def test_item_type_get
        item_type_data = @item_type.get 'sword2h'
        assert item_type_data.is_a? Array
      end
    end
  end
end
