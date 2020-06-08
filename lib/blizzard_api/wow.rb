# frozen_string_literal: true

module BlizzardApi
  # World of Warcraft related classes
  module Wow
    require_relative 'wow/request'
    require_relative 'wow/game_data/generic_data_endpoint'
    require_relative 'wow/search/search_composer'
    require_relative 'wow/search/search_request'

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
    require_relative 'wow/game_data/profession'
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
    # @param region [String] API Region
    # @return {Achievement}
    def self.achievement(region = BlizzardApi.region)
      BlizzardApi::Wow::Achievement.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Auction}
    def self.auction(region = BlizzardApi.region)
      BlizzardApi::Wow::Auction.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {AzeriteEssence}
    def self.azerite_essence(region = BlizzardApi.region)
      BlizzardApi::Wow::AzeriteEssence.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {ConnectedRealm}
    def self.connected_realm(region = BlizzardApi.region)
      BlizzardApi::Wow::ConnectedRealm.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Creature}
    def self.creature(region = BlizzardApi.region)
      BlizzardApi::Wow::Creature.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {GuildCrest}
    def self.guild_crest(region = BlizzardApi.region)
      BlizzardApi::Wow::GuildCrest.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Item}
    def self.item(region = BlizzardApi.region)
      BlizzardApi::Wow::Item.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Journal}
    def self.journal(region = BlizzardApi.region)
      BlizzardApi::Wow::Journal.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Mount}
    def self.mount(region = BlizzardApi.region)
      BlizzardApi::Wow::Mount.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {MythicKeystoneAffix}
    def self.mythic_keystone_affix(region = BlizzardApi.region)
      BlizzardApi::Wow::MythicKeystoneAffix.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {MythicKeystone}
    def self.mythic_keystone(region = BlizzardApi.region)
      BlizzardApi::Wow::MythicKeystone.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {MythicRaidLeaderboard}
    def self.mythic_raid_leaderboard(region = BlizzardApi.region)
      BlizzardApi::Wow::MythicRaidLeaderboard.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {MythicKeystoneLeaderboard}
    def self.mythic_keystone_leaderboard(region = BlizzardApi.region)
      BlizzardApi::Wow::MythicKeystoneLeaderboard.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Pet}
    def self.pet(region = BlizzardApi.region)
      BlizzardApi::Wow::Pet.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {PlayableClass}
    def self.playable_class(region = BlizzardApi.region)
      BlizzardApi::Wow::PlayableClass.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Race}
    def self.playable_race(region = BlizzardApi.region)
      BlizzardApi::Wow::PlayableRace.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {PlayableSpecialization}
    def self.playable_specialization(region = BlizzardApi.region)
      BlizzardApi::Wow::PlayableSpecialization.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {PowerType}
    def self.power_type(region = BlizzardApi.region)
      BlizzardApi::Wow::PowerType.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Profession}
    def self.profession(region = BlizzardApi.region)
      BlizzardApi::Wow::Profession.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {PvpSeason}
    def self.pvp_season(region = BlizzardApi.region)
      BlizzardApi::Wow::PvpSeason.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {PvpTier}
    def self.pvp_tier(region = BlizzardApi.region)
      BlizzardApi::Wow::PvpTier.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Quest}
    def self.quest(region = BlizzardApi.region)
      BlizzardApi::Wow::Quest.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Realm}
    def self.realm(region = BlizzardApi.region)
      BlizzardApi::Wow::Realm.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Region}
    def self.region(region = BlizzardApi.region)
      BlizzardApi::Wow::Region.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Reputation}
    def self.reputation(region = BlizzardApi.region)
      BlizzardApi::Wow::Reputation.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Spell}
    def self.spell(region = BlizzardApi.region)
      BlizzardApi::Wow::Spell.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Talent}
    def self.talent(region = BlizzardApi.region)
      BlizzardApi::Wow::Talent.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Title}
    def self.title(region = BlizzardApi.region)
      BlizzardApi::Wow::Title.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {WowToken}
    def self.wow_token(region = BlizzardApi.region)
      BlizzardApi::Wow::WowToken.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {Character}
    def self.character(region = BlizzardApi.region)
      BlizzardApi::Wow::Character.new(region)
    end

    require_relative 'wow/profile/profile'
    require_relative 'wow/profile/guild'
    require_relative 'wow/profile/character_profile'

    ##
    # @param token [String] A token obtained using the authorization_code flow
    # @param region [String] API Region
    #
    # @return {Profile}
    def self.profile(token, region = BlizzardApi.region)
      BlizzardApi::Wow::AccountProfile.new(token, region)
    end

    ##
    # @param region [String] API Region
    # @return {Guild}
    def self.guild(region = BlizzardApi.region)
      BlizzardApi::Wow::Guild.new(region)
    end

    ##
    # @param region [String] API Region
    # @return {CharacterProfile}
    def self.character_profile(region = BlizzardApi.region)
      BlizzardApi::Wow::CharacterProfile.new(region)
    end
  end
end
