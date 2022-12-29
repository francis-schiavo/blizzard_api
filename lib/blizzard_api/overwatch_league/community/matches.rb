# frozen_string_literal: true

module BlizzardApi
  module OverwatchLeague
    ##
    # This class allows access to OWL2 match data
    #
    # @see https://develop.battle.net/documentation/owl/community-apis
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::OverwatchLeague.matches
    class Matches < OverwatchLeague::Request
      ##
      # Returns match information
      #
      # @!macro request_options
      def get(match_id, **options)
        api_request "#{base_url(:community)}/v1/matches/#{match_id}", **{ ttl: CACHE_DAY }.merge(options)
      end
    end
  end
end
