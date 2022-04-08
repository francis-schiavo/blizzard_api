# frozen_string_literal: true

##
# @!macro [new] init_options
#   @param options [Hash] Initialization options
#     @option options [String] :region API region
#     @option options [Symbol] :model API mode (:regular, :extended)

module BlizzardApi
  # Diablo III related classes
  module Diablo
    require_relative 'diablo/request'
    require_relative 'diablo/game_data/generic_data_endpoint'

    # Diablo data api
    require_relative 'diablo/game_data/season'
    require_relative 'diablo/game_data/era'

    ##
    # @!macro init_options
    # @return {Season}
    def self.season(**options)
      BlizzardApi::Diablo::Season.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Era}
    def self.era(**options)
      BlizzardApi::Diablo::Era.new(**options)
    end

    # Diablo community api
    require_relative 'diablo/community/act'
    require_relative 'diablo/community/artisan'
    require_relative 'diablo/community/follower'
    require_relative 'diablo/community/character_class'
    require_relative 'diablo/community/item_type'
    require_relative 'diablo/community/item'
    require_relative 'diablo/community/profile'

    ##
    # @!macro init_options
    # @return {Act}
    def self.act(**options)
      BlizzardApi::Diablo::Act.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Artisan}
    def self.artisan(**options)
      BlizzardApi::Diablo::Artisan.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Follower}
    def self.follower(**options)
      BlizzardApi::Diablo::Follower.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Character}
    def self.character(**options)
      BlizzardApi::Diablo::CharacterClass.new(**options)
    end

    ##
    # @!macro init_options
    # @return {ItemType}
    def self.item_type(**options)
      BlizzardApi::Diablo::ItemType.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Type}
    def self.item(**options)
      BlizzardApi::Diablo::Item.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Profile}
    def self.profile(**options)
      BlizzardApi::Diablo::Profile.new(**options)
    end
  end
end
