# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class WowTokenTest < Minitest::Test
      def test_wow_token
        token = BlizzardApi::Wow::WowToken.new
        token_data = token.get
        assert token_data.include? :price
      end
    end
  end
end
