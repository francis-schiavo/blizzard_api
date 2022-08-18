# frozen_string_literal: true

require 'test_helper'
require 'date'

module BlizzardApi
  module Wow
    class AuctionTest < Minitest::Test
      def setup
        @auction = BlizzardApi::Wow.auction
      end

      def test_auction_get
        auction_data = @auction.get 4
        assert auction_data.key? :auctions
      end

      def test_auction_commodities
        auction_data = @auction.commodities
        assert auction_data.key? :auctions
      end

      def test_auction_modified_get
        auction_data = @auction.get 4, since: DateTime.parse('2000-01-01Z')
        assert auction_data.key? :auctions
      end

      def test_auction_unmodified_get
        auction_data = @auction.get 4, since: DateTime.parse('2099-01-01Z')
        assert_nil auction_data
      end

      def test_auction_classic_get
        auction_data = @auction.get 4372, 6, classic: true
        assert auction_data.key? :auctions
      end
    end
  end
end
