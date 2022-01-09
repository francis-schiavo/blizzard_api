# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft playable races
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   race = BlizzardApi::Wow.playable_race
    class PlayableRace < Wow::GenericDataEndpoint
      setup 'playable-race', :static, CACHE_TRIMESTER
    end
  end
end
