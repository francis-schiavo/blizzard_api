# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft mythic raid leaderboard
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.mythic_raid_leaderboard
    class MythicRaidLeaderboard < Wow::Request
      ##
      # Fetch leaderboard data for given raid and faction
      #
      # @param raid [String] Raid slug
      # @param faction [String] Faction slug
      #
      # @!macro request_options
      #
      # @!macro response
      def get(raid, faction, options = {})
        opts = options.merge(namespace: endpoint_namespace(:dynamic), ttl: CACHE_DAY)
        api_request "#{base_url(:game_data)}/leaderboard/hall-of-fame/#{raid}/#{faction}", opts
      end
    end
  end
end
