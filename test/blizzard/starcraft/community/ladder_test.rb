# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Starcraft
    class LadderTest < Minitest::Test
      def setup
        @ladder = BlizzardApi::Starcraft.ladder
      end

      def test_ladder_season
        ladder_data = @ladder.season :US
        assert ladder_data[:year]
      rescue BlizzardApi::ApiException => e
        raise e unless e.code.eql? 503 # API is constantly down (abandoned?)
      end
    end
  end
end
