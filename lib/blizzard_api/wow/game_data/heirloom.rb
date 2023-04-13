# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft heirloom data
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.heirloom
    class Heirloom < Wow::GenericDataEndpoint
      setup 'heirloom', :static, CACHE_TRIMESTER
    end
  end
end
