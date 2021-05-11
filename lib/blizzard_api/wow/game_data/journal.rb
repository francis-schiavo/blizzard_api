# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft journal data
    #
    # @see https://develop.battle.net/documentation/world-of-warcraft/game-data-apis
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.journal
    class Journal < Wow::GenericDataEndpoint
      ##
      # This method overrides the inherited default behavior to prevent high server load and fetch time
      #
      # @!macro response
      def index
        raise BlizzardApi::ApiException, 'This endpoint does not have a index method'
      end

      ##
      # This method overrides the inherited default behavior to prevent high server load and fetch time
      #
      # @!macro response
      def complete
        raise BlizzardApi::ApiException, 'This endpoint does not have a complete method'
      end

      ##
      # This method overrides the inherited default behavior to prevent high server load and fetch time
      #
      # @!macro response
      def get(_id, **options)
        raise BlizzardApi::ApiException, 'This endpoint does not have a get method'
      end

      ##
      # Return a list of expansion journal entries
      #
      # @!macro request_options
      #
      # @!macro response
      def expansions(**options)
        api_request "#{endpoint_uri('expansion')}/index", **default_options.merge(options)
      end

      ##
      # Return data about an expansion journal entry
      #
      # @param id [Integer] Journal entry id
      # @!macro request_options
      #
      # @!macro response
      def expansion(id, **options)
        api_request "#{endpoint_uri('expansion')}/#{id}", **default_options.merge(options)
      end

      ##
      # Return a list of instance journal entries
      #
      # @!macro request_options
      #
      # @!macro response
      def instances(**options)
        api_request "#{endpoint_uri('instance')}/index", **default_options.merge(options)
      end

      ##
      # Return data about an instance journal entry
      #
      # @param id [Integer] Journal entry id
      # @!macro request_options
      #
      # @!macro response
      def instance(id, **options)
        api_request "#{endpoint_uri('instance')}/#{id}", **default_options.merge(options)
      end

      ##
      # Return a list of encounter journal entries
      #
      # @!macro request_options
      #
      # @!macro response
      def encounters(**options)
        api_request "#{endpoint_uri('encounter')}/index", **default_options.merge(options)
      end

      ##
      # Return data about an encounter journal entry
      #
      # @param id [Integer] Journal entry id
      # @!macro request_options
      #
      # @!macro response
      def encounter(id, **options)
        api_request "#{endpoint_uri('encounter')}/#{id}", **default_options.merge(options)
      end

      ##
      # Fetch data base on search criteria
      #
      # @param page [Integer] Page o return
      # @param page_size [Integer] Amount of items per page
      #
      # @!macro request_options
      # @!macro response
      def encounter_search(page = 1, page_size = 100, **options)
        search_options = SearchComposer.new(page, page_size)
        yield search_options if block_given?

        api_request "#{endpoint_uri('encounter', :search)}?#{search_options.to_search_query}", **default_options.merge(options)
      end

      protected

      def endpoint_setup
        @endpoint = 'journal'
        @namespace = :static
        @collection = 'journals'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
