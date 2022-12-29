# frozen_string_literal: true

module BlizzardApi
  module OverwatchLeague
    ##
    # This class allows access to OWL2 player data
    #
    # @see https://develop.battle.net/documentation/owl/community-apis
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::OverwatchLeague.players
    class Players < OverwatchLeague::Request
      ##
      # Returns player information
      #
      # @!macro request_options
      def get(player_id, **options)
        api_request "#{base_url(:community)}/v1/players/#{player_id}", **{ ttl: CACHE_DAY }.merge(options)
      end
    end
  end
end
