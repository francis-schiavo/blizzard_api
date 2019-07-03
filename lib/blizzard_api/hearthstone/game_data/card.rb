# frozen_string_literal: true

module BlizzardApi
  module Hearthstone
    ##
    # This class allows access to Hearthstone card data
    #
    # @see https://develop.battle.net/documentation/api-reference/hearthstone-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Hearthstone.card
    class Card < Hearthstone::GenericDataEndpoint
      # Valid options for card search
      VALID_SEARCH_OPTIONS = %i[
        set
        class
        manaCost
        attack
        health
        collectible
        rarity
        type
        minionType
        keyword
        textFilter
        page
        pageSize
        sort
        order
      ].freeze

      ##
      # Fetch all possible data for one of the items listed by the {#index} using its *id*
      #
      # @param search_options [Hash] Search options accepted by the endpoint
      #   @option search_options [String] :set The slug of the set the card belongs to.
      #     If you do not supply a value cards from all sets will be returned.
      #   @option search_options [String] :class The slug of the card's class.
      #   @option search_options [Integer] :manaCost The mana cost required to play the card.
      #     You can include multiple values in a comma-separated list of numeric values.
      #   @option search_options [Integer] :attack The attack power of the minion or weapon.
      #     You can include multiple values in a comma-separated list of numeric values.
      #   @option search_options [Integer] :health The health of a minion.
      #     You can include multiple values in a comma-separated list of numeric values.
      #   @option search_options [Float] :collectible Whether a card is collectible.
      #     A value of 1 indicates that collectible cards should be returned; 0 indicates uncollectible cards.
      #     To return all cards, use a value of '0,1'.
      #   @option search_options [String] :rarity The rarity of a card.
      #     This value must match the rarity slugs found in metadata.
      #   @option search_options [String] :type The type of card (for example, minion, spell, and so on).
      #     This value must match the type slugs found in metadata.
      #   @option search_options [String] :minionType The type of minion card (for example, beast, murloc, dragon, and
      #     so on). This value must match the minion type slugs found in metadata.
      #   @option search_options [String] :keyword A required keyword on the card (for example, battlecry, deathrattle,
      #     and so on). This value must match the keyword slugs found in metadata.
      #   @option search_options [String] :textFilter A text string used to filter cards.
      #     You must include a locale along with the textFilter parameter.
      #   @option search_options [Integer] :page A page number.
      #   @option search_options [Integer] :pageSize The number of results to choose per page.
      #     A value will be selected automatically if you do not supply a pageSize or if the pageSize is higher than the
      #     maximum allowed. @option search_options [String] :sort The field used to sort the results.
      #     Valid values include manaCost, attack, health, and name. Results are sorted by manaCost by default.
      #     Cards will also be sorted by class automatically in most cases.
      #   @option search_options [String] :order The order in which to sort the results.
      #     Valid values are asc or desc. The default value is asc.
      # @!macro request_options
      # @option options [Boolean] :validate_fields If set to true, this method will throw an exception if nay search
      #   option is invalid
      #
      # @!macro response
      def search(search_options = {}, options = {})
        validate_search_options search_options if options.include? :validate_fields

        api_request "#{base_url(:community)}/cards", default_options.merge(options).merge(search_options)
      end

      protected

      def validate_search_options(search_options)
        search_options.each do |field|
          raise ArgumentError, "Unrecognized search option #{field}" unless VALID_SEARCH_OPTIONS.include? field
        end
      end

      def endpoint_setup
        @endpoint = 'cards'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
