# frozen_string_literal: true

module BlizzardApi
  # Hearthstone related classes
  module Hearthstone
    require_relative 'hearthstone/request'
    require_relative 'hearthstone/game_data/generic_data_endpoint'

    # Hearthstone data api
    require_relative 'hearthstone/game_data/card'
    require_relative 'hearthstone/game_data/deck'
    require_relative 'hearthstone/game_data/metadata'

    ##
    # @return {Card}
    def self.card
      BlizzardApi::Hearthstone::Card.new
    end

    ##
    # @return {Deck}
    def self.deck
      BlizzardApi::Hearthstone::Deck.new
    end

    ##
    # @return {Metadata}
    def self.metadata
      BlizzardApi::Hearthstone::Metadata.new
    end
  end
end
