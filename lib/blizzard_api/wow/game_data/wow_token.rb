# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft tokens
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.wow_token
    class WowToken < Wow::Request
      ##
      # Returns wow token data
      #
      # @!macro request_options
      #
      # @!macro response
      def get(options = {})
        opts = { namespace: endpoint_namespace(:dynamic), ttl: CACHE_HOUR }.merge(options)
        api_request "#{base_url(:game_data)}/token/index", opts
      end
    end
  end
end
