# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft challenges
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
    #
    # @deprecated See https://us.forums.blizzard.com/en/blizzard/t/world-of-warcraft-community-api-migration/767
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.challenge
    class Challenge < Wow::Request
      ##
      # Most recent challenge leaderboard for the specified realm
      #
      # @param name [String] Realm's slug
      # @!macro request_options
      #
      # @!macro response
      def realm_index(name, options = {})
        api_request "#{base_url(:community)}/challenge/#{name}", { ttl: CACHE_HOUR }.merge(options)
      end

      ##
      # Most recent challenge leaderboard for the entire region
      #
      # @!macro request_options
      #
      # @!macro response
      def region_index(options = {})
        api_request "#{base_url(:community)}/challenge/region", { ttl: CACHE_HOUR }.merge(options)
      end
    end
  end
end
