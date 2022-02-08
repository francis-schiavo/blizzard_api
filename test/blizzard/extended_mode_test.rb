# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  class ExtendedModeTest < Minitest::Test
    def setup
      @power_types = BlizzardApi::Wow.power_type mode: :extended
    end

    def test_extended_mode
      response, power_types = @power_types.index ignore_cache: true
      assert_equal 200, response.code.to_i
      assert power_types.key? :power_types
    end
  end
end
