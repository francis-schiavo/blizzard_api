# frozen_string_literal: true

module BlizzardApi
  # World of Warcraft related classes
  module Wow
    require_relative 'wow/request'
    require_relative 'wow/game_data/generic_data_endpoint'

    # WoW data api
    require_relative 'wow/game_data/achievement'
    require_relative 'wow/game_data/auction'
    require_relative 'wow/game_data/azerite_essence'
    require_relative 'wow/game_data/connected_realm'
    require_relative 'wow/game_data/creature'
    require_relative 'wow/game_data/guild_crest'
    require_relative 'wow/game_data/item'
    require_relative 'wow/game_data/journal'
    require_relative 'wow/game_data/mount'
    require_relative 'wow/game_data/mythic_keystone_affix'
    require_relative 'wow/game_data/mythic_keystone'
    require_relative 'wow/game_data/mythic_raid_leaderboard'
    require_relative 'wow/game_data/mythic_keystone_leaderboard'
    require_relative 'wow/game_data/pet'
    require_relative 'wow/game_data/playable_class'
    require_relative 'wow/game_data/playable_race'
    require_relative 'wow/game_data/playable_specialization'
    require_relative 'wow/game_data/power_type'
    require_relative 'wow/game_data/pvp_season'
    require_relative 'wow/game_data/pvp_tier'
    require_relative 'wow/game_data/quest'
    require_relative 'wow/game_data/realm'
    require_relative 'wow/game_data/region'
    require_relative 'wow/game_data/reputation'
    require_relative 'wow/game_data/spell'
    require_relative 'wow/game_data/talent'
    require_relative 'wow/game_data/title'
    require_relative 'wow/game_data/wow_token'

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
    # @return {AzeriteEssence}
    def self.azerite_essence
      BlizzardApi::Wow::AzeriteEssence.new
    end

    ##
    # @return {ConnectedRealm}
    def self.connected_realm
      BlizzardApi::Wow::ConnectedRealm.new
    end

    ##
    # @return {Creature}
    def self.creature
      BlizzardApi::Wow::Creature.new
    end

    ##
    # @return {GuildCrest}
    def self.guild_crest
      BlizzardApi::Wow::GuildCrest.new
    end

    ##
    # @return {Item}
    def self.item
      BlizzardApi::Wow::Item.new
    end

    ##
    # @return {Journal}
    def self.journal
      BlizzardApi::Wow::Journal.new
    end

    ##
    # @return {Mount}
    def self.mount
      BlizzardApi::Wow::Mount.new
    end

    ##
    # @return {MythicKeystoneAffix}
    def self.mythic_keystone_affix
      BlizzardApi::Wow::MythicKeystoneAffix.new
    end

    ##
    # @return {MythicKeystone}
    def self.mythic_keystone
      BlizzardApi::Wow::MythicKeystone.new
    end

    ##
    # @return {MythicRaidLeaderboard}
    def self.mythic_raid_leaderboard
      BlizzardApi::Wow::MythicRaidLeaderboard.new
    end

    ##
    # @return {MythicKeystoneLeaderboard}
    def self.mythic_keystone_leaderboard
      BlizzardApi::Wow::MythicKeystoneLeaderboard.new
    end

    ##
    # @return {Pet}
    def self.pet
      BlizzardApi::Wow::Pet.new
    end

    ##
    # @return {PlayableClass}
    def self.playable_class
      BlizzardApi::Wow::PlayableClass.new
    end

    ##
    # @return {Race}
    def self.playable_race
      BlizzardApi::Wow::PlayableRace.new
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
    # @return {PvpSeason}
    def self.pvp_season
      BlizzardApi::Wow::PvpSeason.new
    end

    ##
    # @return {PvpTier}
    def self.pvp_tier
      BlizzardApi::Wow::PvpTier.new
    end

    ##
    # @return {Quest}
    def self.quest
      BlizzardApi::Wow::Quest.new
    end

    ##
    # @return {Realm}
    def self.realm
      BlizzardApi::Wow::Realm.new
    end

    ##
    # @return {Region}
    def self.region
      BlizzardApi::Wow::Region.new
    end

    ##
    # @return {Reputation}
    def self.reputation
      BlizzardApi::Wow::Reputation.new
    end

    ##
    # @return {Spell}
    def self.spell
      BlizzardApi::Wow::Spell.new
    end

    ##
    # @return {Talent}
    def self.talent
      BlizzardApi::Wow::Talent.new
    end

    ##
    # @return {Title}
    def self.title
      BlizzardApi::Wow::Title.new
    end

    ##
    # @return {WowToken}
    def self.wow_token
      BlizzardApi::Wow::WowToken.new
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
    # @return {PvP}
    def self.pvp
      BlizzardApi::Wow::PvP.new
    end

    ##
    # @return {Recipe}
    def self.recipe
      BlizzardApi::Wow::Recipe.new
    end

    ##
    # @return {Zone}
    def self.zone
      BlizzardApi::Wow::Zone.new
    end

    require_relative 'wow/profile/profile'
    require_relative 'wow/profile/guild'
    require_relative 'wow/profile/character_profile'

    ##
    # @param token [String] A token obtained using the authorization_code flow
    #
    # @!macro request_options
    #
    # @return {Profile}
    def self.profile(token)
      BlizzardApi::Wow::AccountProfile.new(token)
    end

    ##
    # @return {Guild}
    def self.guild
      BlizzardApi::Wow::Guild.new
    end

    ##
    # @return {CharacterProfile}
    def self.character_profile
      BlizzardApi::Wow::CharacterProfile.new
    end
  end
end
