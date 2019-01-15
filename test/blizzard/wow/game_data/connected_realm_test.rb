# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class ConnectedRealmTest < Minitest::Test
      def test_connected_realm_index
        realm = BlizzardApi::Wow::ConnectedRealm.new
        realm_data = realm.index
        assert_equal 'https://us.api.blizzard.com/data/wow/connected-realm/4?namespace=dynamic-us',
                     realm_data[:connected_realms][0][:href]
      end

      def test_connected_realm_get
        realm = BlizzardApi::Wow::ConnectedRealm.new
        realm_data = realm.get 11
        assert_equal 11, realm_data[:realms][0][:id]
      end

      def test_connected_realm_complete
        realm = BlizzardApi::Wow::ConnectedRealm.new
        realm_data = realm.complete
        assert_equal 'kilrogg', realm_data[0][:realms][0][:slug]
      end
    end
  end
end
