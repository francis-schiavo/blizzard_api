# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class ConnectedRealmTest < Minitest::Test
      def setup
        @connected_realm = BlizzardApi::Wow.connected_realm
      end

      def test_connected_realm_index
        realm_data = @connected_realm.index
        assert_equal 'https://us.api.blizzard.com/data/wow/connected-realm/4?namespace=dynamic-us',
                     realm_data[:connected_realms][0][:href]
      end

      def test_connected_realm_get
        realm_data = @connected_realm.get 11
        assert_equal 11, realm_data[:realms][0][:id]
      end

      def test_connected_realm_complete
        realm_data = @connected_realm.complete
        assert_equal 'kilrogg', realm_data[0][:realms][0][:slug]
      end

      def test_connected_realm_pagination
        realm_data = @connected_realm.search(1, 10)
        assert_equal 10, realm_data[:results].size
      end

      def test_connected_realm_search
        realm_data = @connected_realm.search(1, 10) do |options|
          options.where 'id', 60
        end
        assert_equal 60, realm_data[:results][0][:data][:id]
      end

      def test_connected_realm_search_or
        realm_data = @connected_realm.search(1, 10) do |options|
          options.where 'id', [60, 67]
        end
        assert_equal 2, realm_data[:results].size
      end

      def test_connected_realm_range_search
        realm_data = @connected_realm.search(1, 100) do |options|
          options.where 'id', min: 60, max: 100
        end
        assert_equal 17, realm_data[:results].size
      end
    end
  end
end
