# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class CovenantTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.covenant
      end

      def test_covenant_index
        data = @endpoint.index
        assert data[:covenants]
      end

      def test_covenant_get
        data = @endpoint.get 3
        assert_equal 'Night Fae', data.dig(:name, :en_US)
      end

      def test_covenant_media
        data = @endpoint.media 3
        assert data.key? :assets
      end

      def test_soulbind_index
        data = @endpoint.soulbinds
        assert data.key? :soulbinds
      end

      def test_soulbind_get
        data = @endpoint.soulbind 1
        assert_equal 'Niya', data.dig(:name, :en_US)
      end

      def test_conduit_index
        data = @endpoint.conduits
        assert data.key? :conduits
      end

      def test_conduit_get
        data = @endpoint.conduit 10
        assert_equal 'Fueled by Violence', data.dig(:name, :en_US)
      end
    end
  end
end
