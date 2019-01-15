# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class RealmTest < Minitest::Test
      def test_realm_index
        realm = BlizzardApi::Wow::Realm.new
        realm_data = realm.index
        assert realm_data[:realms]
      end

      def test_realm_get
        realm = BlizzardApi::Wow::Realm.new
        realm_data = realm.get 'azralon'
        assert_equal 'azralon', realm_data[:slug]
      end

      def test_realm_complete
        realm = BlizzardApi::Wow::Realm.new
        realm_data = realm.complete
        assert_equal 'lightbringer', realm_data[0][:slug]
      end
    end
  end
end
