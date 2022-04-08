# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class WowTokenTest < Minitest::Test
      def setup
        @token = BlizzardApi::Wow.wow_token
      end

      def test_wow_token
        token_data = @token.index
        assert token_data.include? :price
      end
    end
  end
end
