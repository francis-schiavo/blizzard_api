# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class ChallengeTest < Minitest::Test
      def test_challenge_realm
        challenge = BlizzardApi::Wow::Challenge.new
        realm_data = challenge.realm_index 'medivh'
        assert realm_data[:challenge]
      end

      def test_challenge_region
        challenge = BlizzardApi::Wow::Challenge.new
        region_data = challenge.region_index
        assert region_data[:challenge]
      end
    end
  end
end
