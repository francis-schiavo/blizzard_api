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
    end
  end
end
