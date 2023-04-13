# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft creatures
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.creature
    class Creature < Wow::GenericDataEndpoint
      include BlizzardApi::Wow::Searchable

      setup 'creature', :static, CACHE_TRIMESTER

      def index
        raise BlizzardApi::ApiException, 'Creatures endpoint does not have an index method'
      end

      ##
      # Fetch all creature families
      #
      # @!macro request_options
      # @option options [Boolean] :classic If set to true, this method will call the classic version
      # @option options [Boolean] :classic1x If set to true, this method will call the classic era version
      #
      # @!macro response
      def families(**options)
        api_request "#{endpoint_uri('family')}/index", **default_options.merge(options)
      end

      ##
      # Fetch all possible data for one of the items listed by the {#families} using its *id*
      #
      # @param id [Integer] Creature family id
      #
      # @!macro request_options
      # @option options [Boolean] :classic If set to true, this method will call the classic version
      # @option options [Boolean] :classic1x If set to true, this method will call the classic era version
      #
      # @!macro response
      def family(id, **options)
        api_request "#{endpoint_uri('family')}/#{id}", **default_options.merge(options)
      end

      ##
      # Fetch media for one of the items listed by the {#families} using its *id*
      #
      # @param id [Integer] Creature family id
      #
      # @!macro request_options
      # @option options [Boolean] :classic If set to true, this method will call the classic version
      # @option options [Boolean] :classic1x If set to true, this method will call the classic era version
      #
      # @!macro response
      def family_media(id, **options)
        api_request "#{base_url(:media)}/creature-family/#{id}", **default_options.merge(options)
      end

      ##
      # Fetch all creature types
      #
      # @!macro request_options
      # @option options [Boolean] :classic If set to true, this method will call the classic version
      # @option options [Boolean] :classic1x If set to true, this method will call the classic era version
      #
      # @!macro response
      def types(**options)
        api_request "#{endpoint_uri('type')}/index", **default_options.merge(options)
      end

      ##
      # Fetch all possible data for one of the items listed by the {#types} using its *id*
      #
      # @param id [Integer] Creature type id
      #
      # @!macro request_options
      # @option options [Boolean] :classic If set to true, this method will call the classic version
      # @option options [Boolean] :classic1x If set to true, this method will call the classic era version
      #
      # @!macro response
      def type(id, **options)
        api_request "#{endpoint_uri('type')}/#{id}", **default_options.merge(options)
      end

      ##
      # Fetch media for one of the items listed by the {#types} using its *id*
      #
      # @param id [Integer] Creature type id
      #
      # @!macro request_options
      # @option options [Boolean] :classic If set to true, this method will call the classic version
      # @option options [Boolean] :classic1x If set to true, this method will call the classic era version
      #
      # @!macro response
      def display_media(id, **options)
        api_request "#{base_url(:media)}/creature-display/#{id}", **default_options.merge(options)
      end
    end
  end
end
