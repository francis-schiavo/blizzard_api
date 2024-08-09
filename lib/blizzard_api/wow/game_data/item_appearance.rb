# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft item data
    #
    # @see https://develop.battle.net/documentation/world-of-warcraft/game-data-apis
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.item_appearance
    class ItemAppearance < Wow::GenericDataEndpoint
      include BlizzardApi::Wow::Searchable

      setup 'item-appearance', :static, CACHE_TRIMESTER

      ##
      # This method overrides the inherited default behavior to prevent high server load and fetch time
      #
      # @!macro response
      def index
        raise BlizzardApi::ApiException, 'This endpoint does not have an index method'
      end

      ##
      # Return a list of item appearance sets
      #
      # @!macro request_options
      #
      # @!macro response
      def sets(**options)
        api_request "#{endpoint_uri}/set/index", **default_options.merge(options)
      end

      ##
      # Return data about an item appearance set
      #
      # @param id [Integer] Item appearance set id
      # @!macro request_options
      #
      # @!macro response
      def set(id, **options)
        api_request "#{endpoint_uri}/set/#{id}", **default_options.merge(options)
      end

      ##
      # Return a list of item appearance slots
      #
      # @!macro request_options
      #
      # @!macro response
      def slots(**options)
        api_request "#{endpoint_uri}/slot/index", **default_options.merge(options)
      end

      ##
      # Return data about an item appearance slot
      #
      # @param type [Integer] Item appearance slot type
      # @!macro request_options
      #
      # @!macro response
      def slot(type, **options)
        api_request "#{endpoint_uri}/slot/#{type}", **default_options.merge(options)
      end
    end
  end
end
