# frozen_string_literal: true

# frozen_string_lititemTypel: true

require 'test_helper'

module BlizzardApi
  module Diablo
    class ItemTest < Minitest::Test
      def test_item_get
        item = BlizzardApi::Diablo::Item.new
        item_data = item.get 'corrupted-ashbringer', 'Unique_Sword_2H_104_x1'
        assert_equal 'unique_sword_2h_104_x1_demonhunter_male', item_data[:icon]
      end
    end
  end
end
