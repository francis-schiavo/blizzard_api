# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft talent data
    #
    # @see https://develop.battle.net/documentation/world-of-warcraft/game-data-apis
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.talent
    class Talent < Wow::GenericDataEndpoint
      ##
      # Fetch pvp talents
      #
      # @!macro request_options
      #
      # @!macro response
      def pvp_talents(**options)
        api_request "#{base_url(:game_data)}/pvp-talent/index", default_options.merge(options)
      end

      ##
      # Fetch pvp a talent
      #
      # @param id [Integer] Pvp talent id
      #
      # @!macro request_options
      #
      # @!macro response
      def pvp_talent(id, **options)
        api_request "#{base_url(:game_data)}/pvp-talent/#{id}", default_options.merge(options)
      end

      protected

      def endpoint_setup
        @endpoint = 'talent'
        @namespace = :static
        @collection = 'talents'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
