# frozen_string_literal: true

module BlizzardApi
  module OverwatchLeague
    ##
    # This class allows access to OWL2 team data
    #
    # @see https://develop.battle.net/documentation/owl/community-apis
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::OverwatchLeague.teams
    class Teams < OverwatchLeague::Request
      ##
      # Returns team information
      #
      # @!macro request_options
      def get(team_id, **options)
        api_request "#{base_url(:community)}/v1/teams/#{team_id}", **{ ttl: CACHE_DAY }.merge(options)
      end
    end
  end
end
