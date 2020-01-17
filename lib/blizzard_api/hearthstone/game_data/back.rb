# frozen_string_literal: true

module BlizzardApi
  module Hearthstone
    ##
    # This class allows access to Hearthstone card data
    #
    # @see https://develop.battle.net/documentation/api-reference/hearthstone-game-data-api
    # @see https://develop.battle.net/documentation/hearthstone/guides/card-backs
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Hearthstone.card
    class Back < Hearthstone::GenericDataEndpoint
      # Valid options for card search
      VALID_SEARCH_OPTIONS = %i[
        cardBackCategory
        textFilter
        sort
        order
      ].freeze

      ##
      # Returns an up-to-date list of all card backs matching the search criteria. For more information about the
      #   search parameters, see the Card Backs Guide.
      #
      # @param search_options [Hash] Search options accepted by the endpoint
      #   @option search_options [String] :cardBackCategory A category of the card back. The category must match a valid category.
      #   @option search_options [String] :textFilter A text string used to filter cards.
      #     You must include a locale along with the textFilter parameter.
      #   @option search_options [String] :sort The field used to sort the results. Valid value include name.
      #     Results are sorted by date (desc) by default.
      #   @option search_options [String] :order The order in which to sort the results.
      #     Valid values are asc or desc. The default value is asc.
      # @!macro request_options
      # @option options [Boolean] :validate_fields If set to true, this method will throw an exception if nay search
      #   option is invalid
      #
      # @!macro response
      def search(search_options = {}, options = {})
        validate_search_options search_options if options.include? :validate_fields

        api_request "#{base_url(:community)}/cardbacks", default_options.merge(options).merge(search_options)
      end

      protected

      def validate_search_options(search_options)
        search_options.each do |field|
          raise ArgumentError, "Unrecognized search option #{field}" unless VALID_SEARCH_OPTIONS.include? field
        end
      end

      def endpoint_setup
        @endpoint = 'cardbacks'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
