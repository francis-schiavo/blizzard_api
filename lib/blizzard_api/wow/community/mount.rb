# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft mount data
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.mount
    class Mount < Wow::Request
      ##
      # Return a list with all available mounts
      #
      # @!macro request_options
      #
      # @!macro response
      def index(options = {})
        api_request "#{base_url(:community)}/mount/", { ttl: CACHE_TRIMESTER }.merge(options)
      end
    end
  end
end
