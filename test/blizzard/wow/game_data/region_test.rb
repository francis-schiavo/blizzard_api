# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class RegionTest < Minitest::Test
      def setup
        @region = BlizzardApi::Wow.region
      end

      def test_region_index
        region_data = @region.index
        assert_equal 1, region_data[:regions].count

        region_data = @region.index classic: true
        assert_equal 1, region_data[:regions].count
      end

      def test_region_get
        region_data = @region.get 1
        assert_equal 'US', region_data[:tag]

        region_data = @region.get 41, classic: true
        assert_equal 'US', region_data[:tag]
      end

      def test_region_complete
        region_data = @region.complete
        assert_equal 'North America', region_data[0][:name][:en_US]

        region_data = @region.complete classic: true
        assert_equal 'Classic North America', region_data[0][:name][:en_US]
      end
    end
  end
end
