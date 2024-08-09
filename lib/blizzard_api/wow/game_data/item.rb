# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft item data
    #
    # @see https://develop.battle.net/documentation/world-of-warcraft/game-data-apis
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.item
    class Item < Wow::GenericDataEndpoint
      include BlizzardApi::Wow::Searchable

      setup 'item', :static, CACHE_TRIMESTER

      ##
      # This method overrides the inherited default behavior to prevent high server load and fetch time
      #
      # @!macro response
      def index
        raise BlizzardApi::ApiException, 'This endpoint does not have an index method'
      end

      ##
      # Return a list of item classes
      #
      # @!macro request_options
      # @option options [Boolean] :classic If set to true, this method will call the classic version
      # @option options [Boolean] :classic1x If set to true, this method will call the classic era version
      #
      # @!macro response
      def classes(**options)
        api_request "#{endpoint_uri('class')}/index", **default_options.merge(options)
      end
      alias item_classes classes

      ##
      # Return data about an item class
      #
      # @param id [Integer] Item class id
      # @!macro request_options
      # @option options [Boolean] :classic If set to true, this method will call the classic version
      # @option options [Boolean] :classic1x If set to true, this method will call the classic era version
      #
      # @!macro response
      def item_class(id, **options)
        api_request "#{endpoint_uri('class')}/#{id}", **default_options.merge(options)
      end

      ##
      # Return all subclasses of a given class
      #
      # @param id [Integer] Item class id
      # @param subclass_id [Integer] Item subclass id
      # @!macro request_options
      # @option options [Boolean] :classic If set to true, this method will call the classic version
      # @option options [Boolean] :classic1x If set to true, this method will call the classic era version
      #
      # @!macro response
      def subclass(id, subclass_id, **options)
        api_request "#{endpoint_uri('class')}/#{id}/item-subclass/#{subclass_id}", **default_options.merge(options)
      end
      alias item_subclass subclass

      ##
      # Fetch media for an item using its *id*
      #
      # @param id [Integer] Item id
      #
      # @!macro request_options
      # @option options [Boolean] :classic If set to true, this method will call the classic version
      # @option options [Boolean] :classic1x If set to true, this method will call the classic era version
      #
      # @!macro response
      def media(id, **options)
        api_request "#{base_url(:media)}/item/#{id}", **default_options.merge(options)
      end

      ##
      # Return a list of item sets
      #
      # @!macro request_options
      #
      # @!macro response
      def sets(**options)
        api_request "#{endpoint_uri('set')}/index", **default_options.merge(options)
      end

      ##
      # Return data about an item set
      #
      # @param id [Integer] Item set id
      # @!macro request_options
      #
      # @!macro response
      def set(id, **options)
        api_request "#{endpoint_uri('set')}/#{id}", **default_options.merge(options)
      end
    end
  end
end
