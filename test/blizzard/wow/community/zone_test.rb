# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class ZoneTest < Minitest::Test
      def test_zone_index
        zone = BlizzardApi::Wow::Zone.new
        zone_data = zone.index
        assert zone_data[:zones]
      end

      def test_zone_get
        zone = BlizzardApi::Wow::Zone.new
        zone_data = zone.get 4131
        assert_equal 'magisters-terrace', zone_data[:urlSlug]
      end
    end
  end
end
