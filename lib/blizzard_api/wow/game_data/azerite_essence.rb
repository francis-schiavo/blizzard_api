# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft azerite essences
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.azerite_essence
    class AzeriteEssence < Wow::GenericDataEndpoint
      include BlizzardApi::Wow::Searchable

      ##
      # Fetch media for one of the azerite essences listed by the {#index} using its *id*
      #
      # @param id [Integer] Azerite essence id
      #
      # @!macro request_options
      #
      # @!macro response
      def media(id, **options)
        api_request "#{base_url(:media)}/azerite-essence/#{id}", **default_options.merge(options)
      end

      protected

      def endpoint_setup
        @endpoint = 'azerite-essence'
        @namespace = :static
        @collection = 'azerite_essences'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
