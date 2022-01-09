# frozen_string_literal: true

##
# @!macro [new] init_options
#   @param options [Hash] Initialization options
#     @option options [String] :region API region
#     @option options [Symbol] :model API mode (:regular, :extended)

module BlizzardApi
  # Hearthstone related classes
  module Hearthstone
    require_relative 'hearthstone/request'
    require_relative 'hearthstone/game_data/generic_data_endpoint'

    # Hearthstone data api
    require_relative 'hearthstone/game_data/card'
    require_relative 'hearthstone/game_data/back'
    require_relative 'hearthstone/game_data/deck'
    require_relative 'hearthstone/game_data/metadata'

    ##
    # @!macro init_options
    # @return {Card}
    def self.card(**options)
      BlizzardApi::Hearthstone::Card.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Back}
    def self.back(**options)
      BlizzardApi::Hearthstone::Back.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Deck}
    def self.deck(**options)
      BlizzardApi::Hearthstone::Deck.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Metadata}
    def self.metadata(**options)
      BlizzardApi::Hearthstone::Metadata.new(**options)
    end
  end
end
