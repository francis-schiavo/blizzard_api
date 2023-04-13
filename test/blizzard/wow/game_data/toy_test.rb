# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class ToyTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.toy
      end

      def test_toy_index
        data = @endpoint.index
        assert data.key? :toys
      end

      def test_toy_get
        data = @endpoint.get 30
        assert_equal 'Murloc Costume', data.dig(:item, :name, :en_US)
      end
    end
  end
end
