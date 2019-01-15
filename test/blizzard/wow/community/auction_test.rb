# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class AuctionTest < Minitest::Test
      def test_auction_get
        auction = BlizzardApi::Wow::Auction.new
        auction_data = auction.get 'medivh'
        assert auction_data[:files]
      end
    end
  end
end
