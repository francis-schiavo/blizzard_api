# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class MountTest < Minitest::Test
      def setup
        @mount = BlizzardApi::Wow.mount
      end

      def test_mount_index
        mount_data = @mount.index
        assert mount_data.key? :mounts
      end

      def test_mount_get
        mount_data = @mount.get 6
        assert_equal 'Brown Horse', mount_data[:name][:en_US]
      end

      def test_mount_search
        data = @mount.search(1, 100) do |search_options|
          search_options.where 'name.en_US', 'Turtle'
          search_options.order_by 'id'
        end
        assert_equal 'Tartaruga de Montaria', data[:results][0][:data][:name][:pt_BR]
      end
    end
  end
end
