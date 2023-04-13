# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class RegionTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.region
      end

      def test_region_index
        data = @endpoint.index
        assert data.key? :regions

        data = @endpoint.index classic1x: true
        assert data.key? :regions

        data = @endpoint.index classic: true
        assert data.key? :regions
      end

      def test_region_get
        data = @endpoint.get 1
        assert_equal 'US', data[:tag]

        data = @endpoint.get 81, classic1x: true
        assert_equal 'US', data[:tag]

        data = @endpoint.get 41, classic: true
        assert_equal 'US', data[:tag]
      end
    end
  end
end
