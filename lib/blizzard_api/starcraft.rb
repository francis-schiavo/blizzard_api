# frozen_string_literal: true

##
# @!macro [new] init_options
#   @param options [Hash] Initialization options
#     @option options [String] :region API region
#     @option options [Symbol] :model API mode (:regular, :extended)

module BlizzardApi
  # Starcraft II related classes
  module Starcraft
    require_relative 'starcraft/request'

    # Starcraft II data api
    require_relative 'starcraft/game_data/league'

    ##
    # @!macro init_options
    # @return {League}
    def self.league(**options)
      BlizzardApi::Starcraft::League.new(**options)
    end

    # Starcraft community api
    require_relative 'starcraft/community/profile'
    require_relative 'starcraft/community/ladder'
    require_relative 'starcraft/community/account'
    require_relative 'starcraft/community/legacy'

    ##
    # @!macro init_options
    # @return {Profile}
    def self.profile(**options)
      BlizzardApi::Starcraft::Profile.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Ladder}
    def self.ladder(**options)
      BlizzardApi::Starcraft::Ladder.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Account}
    def self.account(**options)
      BlizzardApi::Starcraft::Account.new(**options)
    end

    ##
    # @return {Legacy}
    def self.legacy(**options)
      BlizzardApi::Starcraft::Legacy.new(**options)
    end
  end
end
