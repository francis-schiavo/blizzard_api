# frozen_string_literal: true

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
    # @param region [String] API Region
    # @return {Card}
    def self.card(region = BlizzardApi.region)
      BlizzardApi::Hearthstone::Card.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Back}
    def self.back(region = BlizzardApi.region)
      BlizzardApi::Hearthstone::Back.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Deck}
    def self.deck(region = BlizzardApi.region)
      BlizzardApi::Hearthstone::Deck.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Metadata}
    def self.metadata(region = BlizzardApi.region)
      BlizzardApi::Hearthstone::Metadata.new(region)
    end
  end
end
