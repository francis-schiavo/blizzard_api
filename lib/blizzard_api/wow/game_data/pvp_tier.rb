# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft power types
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.power_type
    class PvpTier < Wow::GenericDataEndpoint
      ##
      # Returns media assets for a pvp tier
      #
      # @!macro request_options
      #
      # @!macro response
      def tier_media(id, options = {})
        api_request "#{base_url(:media)}/#{@endpoint}/#{id}", default_options.merge(options)
      end

      protected

      def endpoint_setup
        @endpoint = 'pvp-tier'
        @namespace = endpoint_namespace :static
        @collection = 'tiers'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
