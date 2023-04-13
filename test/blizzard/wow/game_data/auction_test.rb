# frozen_string_literal: true

require 'test_helper'
require 'date'

module BlizzardApi
  module Wow
    class AuctionTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.auction
      end

      def test_auction_get
        data = @endpoint.get 4
        assert data.key? :auctions
      end

      def test_auction_commodities
        data = @endpoint.commodities
        assert data.key? :auctions
      end

      def test_auction_modified_get
        data = @endpoint.get 4, since: DateTime.parse('2000-01-01Z')
        assert data.key? :auctions
      end

      def test_auction_unmodified_get
        data = @endpoint.get 4, since: DateTime.parse('2099-01-01Z')
        assert_nil data
      end

      def test_auction_classic_get
        data = @endpoint.get 4372, 6, classic: true
        assert data.key? :auctions
      end
    end
  end
end
