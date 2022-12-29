# frozen_string_literal: true

module BlizzardApi
  # Overwatch League related classes
  module OverwatchLeague
    require_relative 'overwatch_league/request'

    # Overwatch League community api
    require_relative 'overwatch_league/community/summary'
    require_relative 'overwatch_league/community/players'
    require_relative 'overwatch_league/community/matches'
    require_relative 'overwatch_league/community/segments'
    require_relative 'overwatch_league/community/teams'

    ##
    # @!macro init_options
    # @return {Summary}
    def self.summary(**options)
      BlizzardApi::OverwatchLeague::Summary.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Players}
    def self.players(**options)
      BlizzardApi::OverwatchLeague::Players.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Matches}
    def self.matches(**options)
      BlizzardApi::OverwatchLeague::Matches.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Segments}
    def self.segments(**options)
      BlizzardApi::OverwatchLeague::Segments.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Teams}
    def self.teams(**options)
      BlizzardApi::OverwatchLeague::Teams.new(**options)
    end
  end
end
