# frozen_string_literal: true

module BlizzardApi
  # Starcraft II related classes
  module Starcraft
    require_relative 'starcraft/request'

    # Starcraft II data api
    require_relative 'starcraft/game_data/league'

    ##
    # @return {League}
    def league
      BlizzardApi::Starcraft::League.new
    end

    # Starcraft community api
    require_relative 'starcraft/community/profile'
    require_relative 'starcraft/community/ladder'
    require_relative 'starcraft/community/account'

    ##
    # @return {Profile}
    def profile
      BlizzardApi::Starcraft::Profile.new
    end

    ##
    # @return {Ladder}
    def ladder
      BlizzardApi::Starcraft::Ladder.new
    end

    ##
    # @return {Account}
    def account
      BlizzardApi::Starcraft::Account.new
    end
  end
end
