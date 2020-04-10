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
    end
  end
end
