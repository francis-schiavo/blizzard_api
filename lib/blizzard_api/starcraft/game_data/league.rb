# frozen_string_literal: true

module BlizzardApi
  module Starcraft
    ##
    # This class allows access to Starcraft II league data
    #
    # @see https://develop.battle.net/documentation/api-reference/starcraft-2-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Starcraft.league
    class League < Starcraft::Request
      ##
      # Return information about league
      #
      # @param [Integer] season_id Season id
      # @param [Integer] queue_id Queue id
      # @param [Integer] team_type Team type
      # @param [Integer] league_id League id
      # @!macro request_options
      def get(season_id, queue_id, team_type, league_id, **options)
        opts = { ttl: CACHE_DAY }.merge(options)
        api_request "#{base_url(:game_data)}/league/#{season_id}/#{queue_id}/#{team_type}/#{league_id}", **opts
      end
    end
  end
end
