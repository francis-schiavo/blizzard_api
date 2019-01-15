# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft PvP data
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.pvp
    class PvP < Wow::Request
      # Arena 2v2
      BRACKET_2V2 = '2v2'
      # Arena 3x3
      BRACKET_3V3 = '3v3'
      # Arena 5x5
      BRACKET_5V5 = '5v5'
      # Rated battlegrounds
      BRACKET_RBG = 'rbg'

      ##
      # Returns the current pvp leaderboard for the current region
      #
      # @param bracket [String] PvP leaderboard category. You can use the constants BRACKET_*
      # @!macro request_options
      #
      # @!macro response
      def get(bracket, options = {})
        api_request "#{base_url(:community)}/leaderboard/#{bracket}", { ttl: CACHE_DAY }.merge(options)
      end
    end
  end
end
