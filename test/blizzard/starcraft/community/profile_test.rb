# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Starcraft
    class ProfileTest < Minitest::Test
      def setup
        @profile = BlizzardApi::Starcraft.profile
      end

      def test_profile_static
        profile_data = @profile.static :US
        assert profile_data[:achievements]
      rescue BlizzardApi::ApiException => e
        raise e unless e.code.eql? 503 # API is constantly down (abandoned?)
      end
    end
  end
end
