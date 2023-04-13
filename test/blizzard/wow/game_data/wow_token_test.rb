# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class WowTokenTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.wow_token
      end

      def test_wow_token
        data = @endpoint.index
        assert data.include? :price
      end
    end
  end
end
