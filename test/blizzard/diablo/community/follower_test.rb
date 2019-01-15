# frozen_string_literal: true

# frozen_string_litartisanl: true

require 'test_helper'

module BlizzardApi
  module Diablo
    class FollowerTest < Minitest::Test
      def test_follower_get
        follower = BlizzardApi::Diablo::Follower.new
        follower_data = follower.get 'templar'
        assert follower_data[:skills]
      end
    end
  end
end
