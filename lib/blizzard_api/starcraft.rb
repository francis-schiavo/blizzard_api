# frozen_string_literal: true

module BlizzardApi
  # Starcraft II related classes
  module Starcraft
    require_relative 'starcraft/request'

    # Starcraft II data api
    require_relative 'starcraft/game_data/league'

    ##
    # @param region [String] API Region
    # @return {League}
    def self.league(region = BlizzardApi.region)
      BlizzardApi::Starcraft::League.new(region)
    end

    # Starcraft community api
    require_relative 'starcraft/community/profile'
    require_relative 'starcraft/community/ladder'
    require_relative 'starcraft/community/account'

    ##
    # @param region [String] API Region
    # @return {Profile}
    def self.profile(region = BlizzardApi.region)
      BlizzardApi::Starcraft::Profile.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Ladder}
    def self.ladder(region = BlizzardApi.region)
      BlizzardApi::Starcraft::Ladder.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Account}
    def self.account(region = BlizzardApi.region)
      BlizzardApi::Starcraft::Account.new(region)
    end
  end
end
