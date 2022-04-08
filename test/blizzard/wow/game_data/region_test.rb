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
        assert region_data.key? :regions

        region_data = @region.index classic1x: true
        assert region_data.key? :regions

        region_data = @region.index classic: true
        assert region_data.key? :regions
      end

      def test_region_get
        region_data = @region.get 1
        assert_equal 'US', region_data[:tag]

        region_data = @region.get 81, classic1x: true
        assert_equal 'US', region_data[:tag]

        region_data = @region.get 41, classic: true
        assert_equal 'US', region_data[:tag]
      end
    end
  end
end
