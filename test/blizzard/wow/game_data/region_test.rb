# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class RegionTest < Minitest::Test
      def test_region_index
        region = BlizzardApi::Wow.region
        region_data = region.index
        assert_equal 1, region_data[:regions].count
      end

      def test_region_get
        region = BlizzardApi::Wow::Region.new
        region_data = region.get 1
        assert_equal 'US', region_data[:tag]
      end

      def test_region_complete
        region = BlizzardApi::Wow::Region.new
        region_data = region.complete
        assert_equal 'North America', region_data[0][:name][:en_US]
      end
    end
  end
end
