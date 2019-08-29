# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft PvP seasons
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.pvp_season
    class PvpSeason < Wow::GenericDataEndpoint
      ##
      # Returns a index of pvp leaderboard for a season
      #
      # @!macro request_options
      #
      # @!macro response
      def leaderboards(season_id, options = {})
        api_request "#{endpoint_uri}/#{season_id}/pvp-leaderboard/index", default_options.merge(options)
      end

      ##
      # Returns the leaderboard for a given season and bracket
      #
      # @!macro request_options
      #
      # @!macro response
      def leaderboard(season_id, brackets, options = {})
        api_request "#{endpoint_uri}/#{season_id}/pvp-leaderboard/#{brackets}", default_options.merge(options)
      end

      ##
      # Returns a list of pvp rewards for a season
      #
      # @!macro request_options
      #
      # @!macro response
      def rewards(season_id, options = {})
        api_request "#{endpoint_uri}/#{season_id}/pvp-reward/index", default_options.merge(options)
      end

      protected

      def endpoint_setup
        @endpoint = 'pvp-season'
        @namespace = :dynamic
        @collection = 'power_types'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
