# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class MountTest < Minitest::Test
      def setup
        @mount = BlizzardApi::Wow::Mount.new
      end

      def test_mount_index
        mount_data = @mount.index
        assert_equal 770, mount_data[:mounts].count

        mount_data = @mount.index use_community_endpoint: true
        assert_equal 919, mount_data[:mounts].count
      end

      def test_mount_get
        mount_data = @mount.get 6
        assert_equal 'Brown Horse', mount_data[:name][:en_US]
      end
    end
  end
end
