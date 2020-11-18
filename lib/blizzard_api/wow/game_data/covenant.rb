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
    class Covenant < Wow::GenericDataEndpoint
      ##
      # Fetch media for one of the covenants listed by the {#index} using its *id*
      #
      # @param id [Integer] Covenant id
      #
      # @!macro request_options
      #
      # @!macro response
      def media(id, options = {})
        api_request "#{base_url(:media)}/covenant/#{id}", default_options.merge(options)
      end

      ##
      # Fetch all soulbinds
      #
      # @!macro request_options
      #
      # @!macro response
      def soulbinds(options = {})
        api_request "#{base_url(:game_data)}/covenant/soulbind/index", default_options.merge(options)
      end

      ##
      # Fetch a soulbind by its id
      #
      # @param id Soulbind id
      #
      # @!macro request_options
      #
      # @!macro response
      def soulbind(id, options = {})
        api_request "#{base_url(:game_data)}/covenant/soulbind/#{id}", default_options.merge(options)
      end

      ##
      # Fetch all conduits
      #
      # @!macro request_options
      #
      # @!macro response
      def conduits(options = {})
        api_request "#{base_url(:game_data)}/covenant/conduit/index", default_options.merge(options)
      end

      ##
      # Fetch a conduit by its id
      #
      # @param id Conduit id
      #
      # @!macro request_options
      #
      # @!macro response
      def conduit(id, options = {})
        api_request "#{base_url(:game_data)}/covenant/conduit/#{id}", default_options.merge(options)
      end

      protected

      def endpoint_setup
        @endpoint = 'covenant'
        @namespace = :static
        @collection = 'covenants'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
