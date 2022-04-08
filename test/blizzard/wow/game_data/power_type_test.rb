# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PowerTypeTest < Minitest::Test
      def setup
        @power_types = BlizzardApi::Wow.power_type
      end

      def test_power_type_index
        power_type_data = @power_types.index
        assert power_type_data.key? :power_types
      end

      def test_power_type_get
        power_type_data = @power_types.get 0
        assert_equal 'Mana', power_type_data[:name][:en_US]
      end
    end
  end
end
