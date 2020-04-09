# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Starcraft
    class ProfileTest < Minitest::Test
      def test_profile_static
        profile = BlizzardApi::Starcraft::Profile.new
        profile_data = profile.static :US
        assert profile_data[:achievements]
      end
    end
  end
end
