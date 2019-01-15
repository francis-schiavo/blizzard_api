# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft achievements
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.achievements
    class Achievement < Wow::Request
      ##
      # Return complete achievement data by achievement id
      #
      # @param id [Integer] Achievement id
      # @!macro request_options
      #
      # @!macro response
      def get(id, options = {})
        api_request "#{base_url(:community)}/achievement/#{id}", { ttl: CACHE_TRIMESTER }.merge(options)
      end

      ##
      # Return a list of possible character achievements
      #
      # @!macro request_options
      #
      # @!macro response
      def character_achievement_index(options = {})
        api_request "#{base_url(:community)}/data/character/achievements", { ttl: CACHE_TRIMESTER }.merge(options)
      end

      ##
      # Return a list of possible guild achievements
      #
      # @!macro request_options
      #
      # @!macro response
      def guild_achievement_index(options = {})
        api_request "#{base_url(:community)}/data/guild/achievements", { ttl: CACHE_TRIMESTER }.merge(options)
      end
    end
  end
end
