# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PowerTypeTest < Minitest::Test
      def test_power_type_index
        power_types = BlizzardApi::Wow::PowerType.new
        power_type_data = power_types.index
        assert_equal 'Mana', power_type_data[:power_types][0][:name][:en_US]
      end

      def test_power_type_get
        power_types = BlizzardApi::Wow::PowerType.new
        power_type_data = power_types.get 0
        assert_equal 'Mana', power_type_data[:name][:en_US]
      end

      def test_power_type_complete
        power_types = BlizzardApi::Wow::PowerType.new
        power_type_data = power_types.complete
        assert_equal 'Mana', power_type_data[0][:name][:en_US]
      end
    end
  end
end
