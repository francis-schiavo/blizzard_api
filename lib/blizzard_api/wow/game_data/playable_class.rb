# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft playable classes
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.playable_class
    class PlayableClass < Wow::GenericDataEndpoint
      setup 'playable-class', :static, CACHE_TRIMESTER

      ##
      # Returns the PvP talent slots data of a specific class
      #
      # @param id [Integer] Class id to fetch talent data. One of the IDs returned by the {index} method
      # @!macro request_options
      #
      # @!macro response
      def talent_slots(id, **options)
        api_request "#{endpoint_uri}/#{id}/pvp-talent-slots", **default_options.merge(options)
      end

      ##
      # Fetch media for one of the playable classes listed by the {#index} using its *id*
      #
      # @param id [Integer] Playable class id
      #
      # @!macro request_options
      #
      # @!macro response
      def media(id, **options)
        api_request "#{base_url(:media)}/playable-class/#{id}", **default_options.merge(options)
      end
    end
  end
end
