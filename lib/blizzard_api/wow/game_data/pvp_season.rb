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
      setup 'pvp-season', :dynamic, CACHE_TRIMESTER

      ##
      # Returns a index of pvp leaderboard for a season
      #
      # @param [Integer] season_id Season ID
      #
      # @!macro request_options
      # @option options [Boolean] :classic1x If set to true, this method will call the classic era version
      #
      # @!macro response
      def leaderboards(season_id, **options)
        api_request "#{endpoint_uri}/#{season_id}/pvp-leaderboard/index", **default_options.merge(options)
      end

      ##
      # Returns the leaderboard for a given season and bracket
      #
      # @param [Integer] season_id Season ID
      # @param [String] brackets Brackets
      #
      # @!macro request_options
      # @option options [Boolean] :classic1x If set to true, this method will call the classic era version
      #
      # @!macro response
      def leaderboard(season_id, brackets, **options)
        api_request "#{endpoint_uri}/#{season_id}/pvp-leaderboard/#{brackets}", **default_options.merge(options)
      end

      ##
      # Returns a list of pvp rewards for a season
      #
      # @!macro request_options
      #
      # @!macro response
      def rewards(season_id, **options)
        api_request "#{endpoint_uri}/#{season_id}/pvp-reward/index", **default_options.merge(options)
      end
    end
  end
end
