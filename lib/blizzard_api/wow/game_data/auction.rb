# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft auctions
    #
    # @see https://develop.battle.net/documentation/world-of-warcraft/game-data-apis
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.auction
    class Auction < Wow::Request
      ##
      # Return all auction houses for the specified connected realm. Classic only.
      #
      # @param connected_realm_id [Integer] A valid connected realm id
      # @!macro request_options
      #
      # @!macro response
      def index(connected_realm_id, **options)
        opts = { ttl: CACHE_HOUR, namespace: :dynamic }.merge(options)
        api_request "#{base_url(:game_data)}/connected-realm/#{connected_realm_id}/auctions/index", **opts
      end

      ##
      # Return all active auctions for the specified connected realm
      #
      # @param connected_realm_id [Integer] A valid connected realm id
      # @!macro request_options
      # @option options [Boolean] :classic1x If set to true, this method will call the classic era version
      #
      # @!macro response
      def get(connected_realm_id, auction_house_id = nil, **options)
        opts = { ttl: CACHE_HOUR, namespace: :dynamic }.merge(options)

        unless auction_house_id.nil?
          return api_request "#{base_url(:game_data)}/connected-realm/#{connected_realm_id}/auctions/#{auction_house_id}", **opts
        end

        api_request "#{base_url(:game_data)}/connected-realm/#{connected_realm_id}/auctions", **opts
      end
    end
  end
end
