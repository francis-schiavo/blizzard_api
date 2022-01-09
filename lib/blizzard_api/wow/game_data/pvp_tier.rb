# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft power types
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.pvp_tier
    class PvpTier < Wow::GenericDataEndpoint
      setup 'pvp-tier',  :static, CACHE_TRIMESTER

      ##
      # Returns media assets for a pvp tier
      #
      # @!macro request_options
      #
      # @!macro response
      def tier_media(id, **options)
        api_request "#{base_url(:media)}/#{self.class.endpoint}/#{id}", **default_options.merge(options)
      end
    end
  end
end
