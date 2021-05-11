# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft mythic raid leaderboard
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.mythic_keystone_leaderboard
    class MythicKeystoneLeaderboard < Wow::Request
      ##
      # Fetch mythic keystone leaderboards for the specified realm
      #
      # @param connected_realm_id [Integer] One of the IDs returned by the {ConnectedRealm#index}
      #
      # @!macro request_options
      #
      # @!macro response
      def index(connected_realm_id, **options)
        api_request "#{endpoint_uri(connected_realm_id)}/index", **default_options(options)
      end

      ##
      # Fetch mythic keystone leaderboard for the specified realm, dungeon and period
      #
      # @param connected_realm_id [Integer] One of the IDs returned by the {ConnectedRealm#index}
      #
      # @!macro request_options
      #
      # @!macro response
      def get(connected_realm_id, dungeon_id, period, **options)
        api_request "#{endpoint_uri(connected_realm_id)}/#{dungeon_id}/period/#{period}", **default_options(options)
      end

      private

      def default_options(options)
        { ttl: CACHE_DAY, namespace: :dynamic }.merge options
      end

      def endpoint_uri(connected_realm_id)
        "#{base_url(:game_data)}/connected-realm/#{connected_realm_id}/mythic-leaderboard"
      end
    end
  end
end
