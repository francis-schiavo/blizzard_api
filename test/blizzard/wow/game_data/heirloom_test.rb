# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class HeirloomTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.heirloom
      end

      def test_heirloom_index
        data = @endpoint.index
        assert_equal 132, data[:heirlooms].count
      end

      def test_heirloom_get
        data = @endpoint.get 1
        assert_equal 'Dignified Headmaster\'s Charge', data.dig(:item, :name, :en_US)
      end
    end
  end
end
