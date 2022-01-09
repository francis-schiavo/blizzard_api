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
    class PvpRegion < Wow::GenericDataEndpoint
      setup 'pvp-region', :dynamic, CACHE_TRIMESTER

      ##
      # Returns a index of pvp seasons within the region
      #
      # @param [Integer] region_id Region ID
      #
      # @!macro request_options
      # @option options [Boolean] :classic1x If set to true, this method will call the classic era version
      #
      # @!macro response
      def seasons(region_id, **options)
        api_request "#{endpoint_uri}/#{region_id}/pvp-season/index", **default_options.merge(options)
      end

      ##
      # Returns a index of pvp seasons within the region
      #
      # @param [Integer] region_id Region ID
      # @param [Integer] season_id Season ID
      #
      # @!macro request_options
      # @option options [Boolean] :classic1x If set to true, this method will call the classic era version
      #
      # @!macro response
      def season(region_id, season_id, **options)
        api_request "#{endpoint_uri}/#{region_id}/pvp-season/#{season_id}", **default_options.merge(options)
      end

      ##
      # Returns a index of pvp leaderboard for a season
      #
      # @param [Integer] region_id Region ID
      # @param [Integer] season_id Season ID
      #
      # @!macro request_options
      # @option options [Boolean] :classic1x If set to true, this method will call the classic era version
      #
      # @!macro response
      def leaderboards(region_id, season_id, **options)
        api_request "#{endpoint_uri}/#{region_id}/pvp-season/#{season_id}/pvp-leaderboard/index", **default_options.merge(options)
      end

      ##
      # Returns the leaderboard for a given season and bracket
      #
      # @param [Integer] region_id Region ID
      # @param [Integer] season_id Season ID
      # @param [String] brackets Brackets
      #
      # @!macro request_options
      # @option options [Boolean] :classic1x If set to true, this method will call the classic era version
      #
      # @!macro response
      def leaderboard(region_id, season_id, brackets, **options)
        api_request "#{endpoint_uri}/#{region_id}/pvp-season/#{season_id}/pvp-leaderboard/#{brackets}", **default_options.merge(options)
      end

      ##
      # Returns a list of pvp rewards for a season
      #
      # @!macro request_options
      #
      # @!macro response
      def rewards(region_id, season_id, **options)
        api_request "#{endpoint_uri}/#{region_id}/pvp-season/#{season_id}/pvp-reward/index", **default_options.merge(options)
      end
    end
  end
end
