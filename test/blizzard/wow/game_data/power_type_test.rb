# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PowerTypeTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.power_type
      end

      def test_power_type_index
        data = @endpoint.index
        assert data.key? :power_types
      end

      def test_power_type_get
        data = @endpoint.get 0
        assert_equal 'Mana', data.dig(:name, :en_US)
      end
    end
  end
end
