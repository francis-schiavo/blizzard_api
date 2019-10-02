# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft zone data
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
    #
    # @deprecated See https://us.forums.blizzard.com/en/blizzard/t/world-of-warcraft-community-api-migration/767
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.zone
    class Zone < Wow::Request
      ##
      # Return a list of all zones
      #
      # @!macro request_options
      #
      # @!macro response
      def index(options = {})
        api_request "#{base_url(:community)}/zone/", { ttl: CACHE_TRIMESTER }.merge(options)
      end

      ##
      # Return complete information about a zone by its id
      #
      # @param id [Integer] Zone id
      # @!macro request_options
      #
      # @!macro response
      def get(id, options = {})
        api_request "#{base_url(:community)}/zone/#{id}", { ttl: CACHE_TRIMESTER }.merge(options)
      end
    end
  end
end
