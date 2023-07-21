# frozen_string_literal: true

##
# @!macro [new] init_options
#   @param options [Hash] Initialization options
#     @option options [String] :region API region
#     @option options [Symbol] :model API mode (:regular, :extended)

module BlizzardApi
  # World of Warcraft related classes
  module Wow
    require_relative 'wow/request'
    require_relative 'wow/game_data/generic_data_endpoint'
    require_relative 'wow/search/search_composer'
    require_relative 'wow/search/search_request'
    require_relative 'wow/slug'

    # WoW data api
    require_relative 'wow/game_data/achievement'
    require_relative 'wow/game_data/auction'
    require_relative 'wow/game_data/azerite_essence'
    require_relative 'wow/game_data/connected_realm'
    require_relative 'wow/game_data/covenant'
    require_relative 'wow/game_data/creature'
    require_relative 'wow/game_data/guild_crest'
    require_relative 'wow/game_data/heirloom'
    require_relative 'wow/game_data/item'
    require_relative 'wow/game_data/journal'
    require_relative 'wow/game_data/media'
    require_relative 'wow/game_data/modified_crafting'
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
    require_relative 'wow/game_data/pvp_region'
    require_relative 'wow/game_data/pvp_season'
    require_relative 'wow/game_data/pvp_tier'
    require_relative 'wow/game_data/quest'
    require_relative 'wow/game_data/realm'
    require_relative 'wow/game_data/region'
    require_relative 'wow/game_data/reputation'
    require_relative 'wow/game_data/spell'
    require_relative 'wow/game_data/talent'
    require_relative 'wow/game_data/tech_talent'
    require_relative 'wow/game_data/title'
    require_relative 'wow/game_data/toy'
    require_relative 'wow/game_data/wow_token'

    ##
    # @!macro init_options
    # @return {Achievement}
    def self.achievement(**options)
      BlizzardApi::Wow::Achievement.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Auction}
    def self.auction(**options)
      BlizzardApi::Wow::Auction.new(**options)
    end

    ##
    # @!macro init_options
    # @return {AzeriteEssence}
    def self.azerite_essence(**options)
      BlizzardApi::Wow::AzeriteEssence.new(**options)
    end

    ##
    # @!macro init_options
    # @return {ConnectedRealm}
    def self.connected_realm(**options)
      BlizzardApi::Wow::ConnectedRealm.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Covenant}
    def self.covenant(**options)
      BlizzardApi::Wow::Covenant.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Creature}
    def self.creature(**options)
      BlizzardApi::Wow::Creature.new(**options)
    end

    ##
    # @!macro init_options
    # @return {GuildCrest}
    def self.guild_crest(**options)
      BlizzardApi::Wow::GuildCrest.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Heirloom}
    def self.heirloom(**options)
      BlizzardApi::Wow::Heirloom.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Item}
    def self.item(**options)
      BlizzardApi::Wow::Item.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Journal}
    def self.journal(**options)
      BlizzardApi::Wow::Journal.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Media}
    def self.media(**options)
      BlizzardApi::Wow::Media.new(**options)
    end

    ##
    # @!macro init_options
    # @return {ModifiedCrafting}
    def self.modified_crafting(**options)
      BlizzardApi::Wow::ModifiedCrafting.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Mount}
    def self.mount(**options)
      BlizzardApi::Wow::Mount.new(**options)
    end

    ##
    # @!macro init_options
    # @return {MythicKeystoneAffix}
    def self.mythic_keystone_affix(**options)
      BlizzardApi::Wow::MythicKeystoneAffix.new(**options)
    end

    ##
    # @!macro init_options
    # @return {MythicKeystone}
    def self.mythic_keystone(**options)
      BlizzardApi::Wow::MythicKeystone.new(**options)
    end

    ##
    # @!macro init_options
    # @return {MythicRaidLeaderboard}
    def self.mythic_raid_leaderboard(**options)
      BlizzardApi::Wow::MythicRaidLeaderboard.new(**options)
    end

    ##
    # @!macro init_options
    # @return {MythicKeystoneLeaderboard}
    def self.mythic_keystone_leaderboard(**options)
      BlizzardApi::Wow::MythicKeystoneLeaderboard.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Pet}
    def self.pet(**options)
      BlizzardApi::Wow::Pet.new(**options)
    end

    ##
    # @!macro init_options
    # @return {PlayableClass}
    def self.playable_class(**options)
      BlizzardApi::Wow::PlayableClass.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Race}
    def self.playable_race(**options)
      BlizzardApi::Wow::PlayableRace.new(**options)
    end

    ##
    # @!macro init_options
    # @return {PlayableSpecialization}
    def self.playable_specialization(**options)
      BlizzardApi::Wow::PlayableSpecialization.new(**options)
    end

    ##
    # @!macro init_options
    # @return {PowerType}
    def self.power_type(**options)
      BlizzardApi::Wow::PowerType.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Profession}
    def self.profession(**options)
      BlizzardApi::Wow::Profession.new(**options)
    end

    ##
    # @!macro init_options
    # @return {PvpRegion}
    def self.pvp_region(**options)
      BlizzardApi::Wow::PvpRegion.new(**options)
    end

    ##
    # @!macro init_options
    # @return {PvpSeason}
    def self.pvp_season(**options)
      BlizzardApi::Wow::PvpSeason.new(**options)
    end

    ##
    # @!macro init_options
    # @return {PvpTier}
    def self.pvp_tier(**options)
      BlizzardApi::Wow::PvpTier.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Quest}
    def self.quest(**options)
      BlizzardApi::Wow::Quest.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Realm}
    def self.realm(**options)
      BlizzardApi::Wow::Realm.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Region}
    def self.region(**options)
      BlizzardApi::Wow::Region.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Reputation}
    def self.reputation(**options)
      BlizzardApi::Wow::Reputation.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Spell}
    def self.spell(**options)
      BlizzardApi::Wow::Spell.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Talent}
    def self.talent(**options)
      BlizzardApi::Wow::Talent.new(**options)
    end

    ##
    # @!macro init_options
    # @return {TechTalent}
    def self.tech_talent(**options)
      BlizzardApi::Wow::TechTalent.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Title}
    def self.title(**options)
      BlizzardApi::Wow::Title.new(**options)
    end

    ##
    # @!macro init_options
    # @return {Toy}
    def self.toy(**options)
      BlizzardApi::Wow::Toy.new(**options)
    end

    ##
    # @!macro init_options
    # @return {WowToken}
    def self.wow_token(**options)
      BlizzardApi::Wow::WowToken.new(**options)
    end

    require_relative 'wow/profile/account_profile'
    require_relative 'wow/profile/guild'
    require_relative 'wow/profile/character_profile'

    ##
    # @param token [String] A token obtained using the authorization_code flow
    # @!macro init_options
    #
    # @return {Profile}
    def self.profile(token, **options)
      BlizzardApi::Wow::AccountProfile.new(token, **options)
    end

    ##
    # @!macro init_options
    # @return {Guild}
    def self.guild(**options)
      BlizzardApi::Wow::Guild.new(**options)
    end

    ##
    # @!macro init_options
    # @return {CharacterProfile}
    def self.character_profile(**options)
      BlizzardApi::Wow::CharacterProfile.new(**options)
    end
  end
end
