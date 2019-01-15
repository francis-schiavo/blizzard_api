# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft auctions
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.auction
    class Auction < Wow::Request
      ##
      # Return a link to the most recent dump of all active auctions for the desired realm
      #
      # @param realm [String] Realm's slug
      # @!macro request_options
      #
      # @!macro response
      def get(realm, options = {})
        api_request "#{base_url(:community)}/auction/data/#{realm}", { ttl: CACHE_HOUR }.merge(options)
      end
    end
  end
end
