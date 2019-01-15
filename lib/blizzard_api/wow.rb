# frozen_string_literal: true

module BlizzardApi
  # World of Warcraft related classes
  module Wow
    require_relative 'wow/request'
    require_relative 'wow/game_data/generic_data_endpoint'

    # WoW data api
    require_relative 'wow/game_data/region'
    require_relative 'wow/game_data/realm'
    require_relative 'wow/game_data/connected_realm'
    require_relative 'wow/game_data/race'
    require_relative 'wow/game_data/playable_class'
    require_relative 'wow/game_data/playable_specialization'
    require_relative 'wow/game_data/power_type'
    require_relative 'wow/game_data/mythic_keystone_affix'

    ##
    # @return {Region}
    def self.region
      BlizzardApi::Wow::Region.new
    end

    ##
    # @return {Realm}
    def self.realm
      BlizzardApi::Wow::Realm.new
    end

    ##
    # @return {ConnectedRealm}
    def self.connected_realm
      BlizzardApi::Wow::ConnectedRealm.new
    end

    ##
    # @return {Race}
    def self.race
      BlizzardApi::Wow::Race.new
    end

    ##
    # @return {PlayableClass}
    def self.playable_class
      BlizzardApi::Wow::PlayableClass.new
    end

    ##
    # @return {PlayableSpecialization}
    def self.playable_specialization
      BlizzardApi::Wow::PlayableSpecialization.new
    end

    ##
    # @return {PowerType}
    def self.power_type
      BlizzardApi::Wow::PowerType.new
    end

    ##
    # @return {MythicKeystoneAffix}
    def self.mythic_keystone_affix
      BlizzardApi::Wow::MythicKeystoneAffix.new
    end

    # Wow community api
    require_relative 'wow/community/achievements'
    require_relative 'wow/community/auction'
    require_relative 'wow/community/boss'
    require_relative 'wow/community/challenge'
    require_relative 'wow/community/character'
    require_relative 'wow/community/guild'
    require_relative 'wow/community/item'
    require_relative 'wow/community/mount'
    require_relative 'wow/community/pets'
    require_relative 'wow/community/pvp'
    require_relative 'wow/community/quest'
    require_relative 'wow/community/recipe'
    require_relative 'wow/community/spell'
    require_relative 'wow/community/zone'

    ##
    # @return {Achievement}
    def self.achievement
      BlizzardApi::Wow::Achievement.new
    end

    ##
    # @return {Auction}
    def self.auction
      BlizzardApi::Wow::Auction.new
    end

    ##
    # @return {Boss}
    def self.boss
      BlizzardApi::Wow::Boss.new
    end

    ##
    # @return {Challenge}
    def self.challenge
      BlizzardApi::Wow::Challenge.new
    end

    ##
    # @return {Character}
    def self.character
      BlizzardApi::Wow::Character.new
    end

    ##
    # @return {Guild}
    def self.guild
      BlizzardApi::Wow::Guild.new
    end

    ##
    # @return {Item}
    def self.item
      BlizzardApi::Wow::Item.new
    end

    ##
    # @return {Mount}
    def self.mount
      BlizzardApi::Wow::Mount.new
    end

    ##
    # @return {Pet}
    def self.pet
      BlizzardApi::Wow::Pet.new
    end

    ##
    # @return {PvP}
    def self.pvp
      BlizzardApi::Wow::PvP.new
    end

    ##
    # @return {Quest}
    def self.quest
      BlizzardApi::Wow::Quest.new
    end

    ##
    # @return {Recipe}
    def self.recipe
      BlizzardApi::Wow::Recipe.new
    end

    ##
    # @return {Spell}
    def self.spell
      BlizzardApi::Wow::Spell.new
    end

    ##
    # @return {Zone}
    def self.zone
      BlizzardApi::Wow::Zone.new
    end
  end
end
