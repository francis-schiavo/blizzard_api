# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class MountTest < Minitest::Test
      def test_mount_index
        mount = BlizzardApi::Wow::Mount.new
        mount_data = mount.index
        assert mount_data[:mounts]
      end
    end
  end
end
