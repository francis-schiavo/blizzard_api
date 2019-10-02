# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft quest data
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
    #
    # @deprecated See https://us.forums.blizzard.com/en/blizzard/t/world-of-warcraft-community-api-migration/767
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.quest
    class Quest < Wow::Request
      ##
      # Return information about a quest by its id
      #
      # @param id [Integer] Quest id
      # @!macro request_options
      #
      # @!macro response
      def get(id, options = {})
        api_request "#{base_url(:community)}/quest/#{id}", { ttl: CACHE_TRIMESTER }.merge(options)
      end
    end
  end
end
