# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft pet data
    #
    # @see https://develop.battle.net/documentation/world-of-warcraft/game-data-apis
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.pet
    class Pet < Wow::GenericDataEndpoint
      ##
      # Fetch media for one of the pets listed by the {#index} using its *id*
      #
      # @param id [Integer] Pet id
      #
      # @!macro request_options
      #
      # @!macro response
      def media(id, **options)
        api_request "#{base_url(:media)}/pet/#{id}", **default_options.merge(options)
      end

      ##
      # Fetch all pet abilities
      #
      # @!macro request_options
      #
      # @!macro response
      def abilities(**options)
        api_request "#{endpoint_uri('ability')}/index", **default_options.merge(options)
      end

      ##
      # Fetch a pet ability
      #
      # @param id [Integer] Pet id
      #
      # @!macro request_options
      #
      # @!macro response
      def ability(id, **options)
        api_request "#{endpoint_uri('ability')}/#{id}", **default_options.merge(options)
      end

      ##
      # Fetch media for one of the pet abilities listed by the {#abilities} using its *id*
      #
      # @param id [Integer] Pet ability id
      #
      # @!macro request_options
      #
      # @!macro response
      def ability_media(id, **options)
        api_request "#{base_url(:media)}/pet-ability/#{id}", **default_options.merge(options)
      end

      protected

      def endpoint_setup
        @endpoint = 'pet'
        @namespace = :static
        @collection = 'pets'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
