# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft mythic keystone affixes
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.mythic_keystone_affix
    class MythicKeystoneAffix < Wow::GenericDataEndpoint
      ##
      # Fetch media for one of the affixes listed by the {#index} using its *id*
      #
      # @param id [Integer] Keystone affix id
      #
      # @!macro request_options
      #
      # @!macro response
      def media(id, **options)
        api_request "#{base_url(:media)}/keystone-affix/#{id}", default_options.merge(options)
      end

      protected

      def endpoint_setup
        @endpoint = 'keystone-affix'
        @namespace = :static
        @collection = 'affixes'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
