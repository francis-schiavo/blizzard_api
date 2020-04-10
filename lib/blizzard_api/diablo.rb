# frozen_string_literal: true

module BlizzardApi
  # Diablo III related classes
  module Diablo
    require_relative 'diablo/request'
    require_relative 'diablo/game_data/generic_data_endpoint'

    # Diablo data api
    require_relative 'diablo/game_data/season'
    require_relative 'diablo/game_data/era'

    ##
    # @param region [String] API Region
    # @return {Season}
    def self.season(region = BlizzardApi.region)
      BlizzardApi::Diablo::Season.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Era}
    def self.era(region = BlizzardApi.region)
      BlizzardApi::Diablo::Era.new(region)
    end

    # Diablo community api
    require_relative 'diablo/community/act'
    require_relative 'diablo/community/artisan'
    require_relative 'diablo/community/follower'
    require_relative 'diablo/community/character'
    require_relative 'diablo/community/item_type'
    require_relative 'diablo/community/item'
    require_relative 'diablo/community/profile'

    ##
    # @param region [String] API Region
    # @return {Act}
    def self.act(region = BlizzardApi.region)
      BlizzardApi::Diablo::Act.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Artisan}
    def self.artisan(region = BlizzardApi.region)
      BlizzardApi::Diablo::Artisan.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Follower}
    def self.follower(region = BlizzardApi.region)
      BlizzardApi::Diablo::Follower.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Character}
    def self.character(region = BlizzardApi.region)
      BlizzardApi::Diablo::Character.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {ItemType}
    def self.item_type(region = BlizzardApi.region)
      BlizzardApi::Diablo::ItemType.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Type}
    def self.item(region = BlizzardApi.region)
      BlizzardApi::Diablo::Item.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Profile}
    def self.profile(region = BlizzardApi.region)
      BlizzardApi::Diablo::Profile.new(region)
    end
  end
end
