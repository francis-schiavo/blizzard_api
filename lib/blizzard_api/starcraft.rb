# frozen_string_literal: true

module BlizzardApi
  # Starcraft II related classes
  module Starcraft
    require_relative 'starcraft/request'

    # Starcraft II data api
    require_relative 'starcraft/game_data/league'

    ##
    # @return {League}
    def self.league
      BlizzardApi::Starcraft::League.new
    end

    # Starcraft community api
    require_relative 'starcraft/community/profile'
    require_relative 'starcraft/community/ladder'
    require_relative 'starcraft/community/account'
    require_relative 'starcraft/community/legacy'

    ##
    # @return {Profile}
    def self.profile
      BlizzardApi::Starcraft::Profile.new
    end

    ##
    # @return {Ladder}
    def self.ladder
      BlizzardApi::Starcraft::Ladder.new
    end

    ##
    # @return {Account}
    def self.account
      BlizzardApi::Starcraft::Account.new
    end
    
    ##
    # @return {Legacy}
    def self.legacy
      BlizzardApi::Starcraft::Legacy.new
    end
  end
end
