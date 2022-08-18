# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Hearthstone
    class BackTest < Minitest::Test
      def setup
        @back = BlizzardApi::Hearthstone.back
      end

      def test_back_index
        back_data = @back.search
        assert back_data[:cardBacks]
      end

      def test_back_get
        back_data = @back.get 2
        assert back_data[:slug]
      end
    end
  end
end
