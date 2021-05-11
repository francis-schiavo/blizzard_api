# frozen_string_literal: true

module BlizzardApi
  module Diablo
    ##
    # This class allows access to Diablo III follower data
    #
    # @see https://develop.battle.net/documentation/api-reference/diablo-3-community-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Diablo.follower
    class Follower < BlizzardApi::Diablo::Request
      ##
      # Return information about a follower
      #
      # @param follower_slug [String] Follower slug
      # @!macro request_options
      #
      # @!macro response
      def get(follower_slug, **options)
        api_request "#{base_url(:community)}/data/follower/#{follower_slug}", **{ ttl: CACHE_TRIMESTER }.merge(options)
      end
    end
  end
end
