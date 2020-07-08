# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class RealmTest < Minitest::Test
      def setup
        @realm = BlizzardApi::Wow.realm
      end

      def test_realm_index
        realm_data = @realm.index
        assert realm_data[:realms]

        realm_data = @realm.index classic: true
        assert realm_data[:realms]
      end

      def test_realm_get
        realm_data = @realm.get 'azralon'
        assert_equal 'azralon', realm_data[:slug]

        realm_data = @realm.get 'atiesh', classic: true
        assert_equal 'atiesh', realm_data[:slug]
      end

      def test_realm_complete
        realm_data = @realm.complete
        assert_equal 'lightbringer', realm_data[0][:slug]

        realm_data = @realm.complete classic: true
        assert_equal 'atiesh', realm_data[0][:slug]
      end

      def test_realm_search
        realm_data = @realm.search do |options|
          options.where 'name.en_US', %w[Azralon Nemesis]
        end
        assert_equal 2, realm_data[:results].size

        realm_data = @realm.search(1, 100, classic: true) do |search_options|
          search_options.where 'name.en_US', %w[Mankrik Pagle]
        end
        assert_equal 2, realm_data[:results].size
      end
    end
  end
end
