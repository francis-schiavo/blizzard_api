# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class AuctionTest < Minitest::Test
      def setup
        @auction = BlizzardApi::Wow.auction
      end

      def test_auction_get
        auction_data = @auction.get 1146
        assert auction_data.key? :auctions
      end
    end
  end
end
