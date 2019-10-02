# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft spell data
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
    #
    # @deprecated See https://us.forums.blizzard.com/en/blizzard/t/world-of-warcraft-community-api-migration/767
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.spell
    class Spell < Wow::Request
      ##
      # Return information about a spell by its id
      #
      # @param id [Integer] Spell id
      # @!macro request_options
      #
      # @!macro response
      def get(id, options = {})
        api_request "#{base_url(:community)}/spell/#{id}", { ttl: CACHE_TRIMESTER }.merge(options)
      end
    end
  end
end
