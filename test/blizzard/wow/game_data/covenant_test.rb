# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class CovenantTest < Minitest::Test
      def setup
        @covenant = BlizzardApi::Wow.covenant
      end

      def test_covenant_index
        data = @covenant.index
        assert_equal 4, data[:covenants].count
      end

      def test_covenant_get
        data = @covenant.get 3
        assert_equal 'Night Fae', data[:name][:en_US]
      end

      def test_covenant_media
        data = @covenant.media 3
        assert data.key? :assets
      end

      def test_soulbind_index
        data = @covenant.soulbinds
        assert data.key? :soulbinds
      end

      def test_soulbind_get
        data = @covenant.soulbind 1
        assert_equal 'Niya', data[:name][:en_US]
      end

      def test_conduit_index
        data = @covenant.conduits
        assert data.key? :conduits
      end

      def test_conduit_get
        data = @covenant.conduit 10
        assert_equal 'Fueled by Violence', data[:name][:en_US]
      end
    end
  end
end
