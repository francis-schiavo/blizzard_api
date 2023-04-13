# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class ConnectedRealmTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.connected_realm
      end

      def test_connected_realm_index
        data = @endpoint.index
        assert_equal 'https://us.api.blizzard.com/data/wow/connected-realm/121?namespace=dynamic-us',
                     data.dig(:connected_realms, 0, :href)
      end

      def test_connected_realm_get
        data = @endpoint.get 11
        assert_equal 11, data.dig(:realms, 0, :id)
      end

      def test_connected_realm_pagination
        data = @endpoint.search(1, 10)
        assert 10, data[:results].size
      end

      def test_connected_realm_search
        data = @endpoint.search(1, 10) do |options|
          options.where 'id', 60
        end
        assert_equal 60, data.dig(:results, 0, :data, :id)
      end

      def test_connected_realm_search_or
        data = @endpoint.search(1, 10) do |options|
          options.where 'id', [60, 67]
        end
        assert_equal 2, data[:results].size
      end

      def test_connected_realm_range_search
        data = @endpoint.search(1, 100) do |options|
          options.where 'id', min: 60, max: 100
        end
        assert_equal 17, data[:results].size
      end
    end
  end
end
