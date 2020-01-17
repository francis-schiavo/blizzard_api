# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Hearthstone
    class BackTest < Minitest::Test
      def test_back_index
        back = BlizzardApi::Hearthstone::Back.new
        back_data = back.index
        assert back_data[:cardBacks]
      end

      def test_back_get
        back = BlizzardApi::Hearthstone::Back.new
        back_data = back.get 1
        assert back_data[:slug]
      end
    end
  end
end
