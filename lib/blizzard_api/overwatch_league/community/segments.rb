# frozen_string_literal: true

module BlizzardApi
  module OverwatchLeague
    ##
    # This class allows access to OWL2 segment data
    #
    # @see https://develop.battle.net/documentation/owl/community-apis
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::OverwatchLeague.segments
    class Segments < OverwatchLeague::Request
      ##
      # Returns segment information
      #
      # @!macro request_options
      def get(segment_id, **options)
        api_request "#{base_url(:community)}/v1/segments/#{segment_id}", **{ ttl: CACHE_DAY }.merge(options)
      end
    end
  end
end
