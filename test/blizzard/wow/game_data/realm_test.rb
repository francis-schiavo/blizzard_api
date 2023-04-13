# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class RealmTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.realm
      end

      def test_realm_index
        data = @endpoint.index
        assert data.key? :realms

        data = @endpoint.index classic1x: true
        assert data.key? :realms
      end

      def test_realm_get
        data = @endpoint.get 'azralon'
        assert_equal 'azralon', data[:slug]

        data = @endpoint.get 'atiesh', classic1x: true
        assert_equal 'atiesh', data[:slug]
      end

      def test_realm_search
        data = @endpoint.search do |options|
          options.where 'name.en_US', %w[Azralon Nemesis]
        end
        assert_equal 2, data[:results].size

        data = @endpoint.search(1, 100, classic1x: true) do |search_options|
          search_options.where 'name.en_US', %w[Mankrik Pagle]
        end
        assert_equal 2, data[:results].size
      end
    end
  end
end
