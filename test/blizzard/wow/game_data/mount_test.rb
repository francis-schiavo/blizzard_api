# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class MountTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.mount
      end

      def test_mount_index
        data = @endpoint.index
        assert data.key? :mounts
      end

      def test_mount_get
        data = @endpoint.get 6
        assert_equal 'Brown Horse', data.dig(:name, :en_US)
      end

      def test_mount_search
        data = @endpoint.search(1, 100) do |search_options|
          search_options.where 'name.en_US', 'Turtle'
          search_options.order_by 'id'
        end
        assert_equal 'Tartaruga de Montaria', data.dig(:results, 0, :data, :name, :pt_BR)
      end
    end
  end
end
