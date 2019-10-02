# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft bosses
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
    #
    # @deprecated See https://us.forums.blizzard.com/en/blizzard/t/world-of-warcraft-community-api-migration/767
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.boss
    class Boss < Wow::Request
      ##
      # Return a list of every World of Warcraft boss currently in game
      #
      # @!macro request_options
      #
      # @!macro response
      def index(options = {})
        api_request "#{base_url(:community)}/boss/", { ttl: CACHE_TRIMESTER }.merge(options)
      end

      ##
      # Return detailed information about a boss by its ID
      #
      # @param id [Integer] Boss id
      # @!macro request_options
      #
      # @!macro response
      def get(id, options = {})
        api_request "#{base_url(:community)}/boss/#{id}", { ttl: CACHE_TRIMESTER }.merge(options)
      end
    end
  end
end
