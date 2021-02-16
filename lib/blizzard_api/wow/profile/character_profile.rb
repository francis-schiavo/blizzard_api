# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft character profile data
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.achievement
    class CharacterProfile < Wow::Request
      include BlizzardApi::Wow::Slug

      ##
      # Return character achievements
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def get(realm, character, **options)
        character_request realm, character, options
      end

      ##
      # Return character achievements
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def achievements(realm, character, **options)
        character_request realm, character, 'achievements', options
      end

      ##
      # Return character achievements statistics
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def achievement_statistics(realm, character, **options)
        character_request realm, character, 'achievements/statistics', options
      end

      ##
      # Return character appearance
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def appearance(realm, character, **options)
        character_request realm, character, 'appearance', options
      end

      ##
      # Return a character's collections
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def collections(realm, character, **options)
        character_request realm, character, 'collections', options
      end

      ##
      # Return a character's pet collection
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def pets(realm, character, **options)
        character_request realm, character, 'collections/pets', options
      end

      ##
      # Return a character's mount collection
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def mounts(realm, character, **options)
        character_request realm, character, 'collections/mounts', options
      end

      ##
      # Return a character's encounter summary
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def encounters(realm, character, **options)
        character_request realm, character, 'encounters', options
      end

      ##
      # Return a character's dungeon progress
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def dungeons(realm, character, **options)
        character_request realm, character, 'encounters/dungeons', options
      end

      ##
      # Return a character's raid progress
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def raids(realm, character, **options)
        character_request realm, character, 'encounters/raids', options
      end

      ##
      # Return character equipment
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def equipment(realm, character, **options)
        character_request realm, character, 'equipment', options
      end

      ##
      # Return a character's hunter pets
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def hunter_pets(realm, character, **options)
        character_request realm, character, 'hunter-pets', options
      end

      ##
      # Return character media
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def media(realm, character, **options)
        character_request realm, character, 'character-media', options
      end

      ##
      # Return the mythic keystone profile of a character
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def mythic_keystone_profile(realm, character, **options)
        character_request realm, character, 'mythic-keystone-profile', options
      end

      ##
      # Return the mythic keystone profile of a character
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @param season [Integer] Season ID if you want only a specific season or nil to include all.
      # @!macro request_options
      #
      # @!macro response
      def mythic_keystone_seasons(realm, character, season = nil, **options)
        character_request realm, character, "mythic-keystone-profile/season/#{season}", options
      end

      ##
      # Return professions from a character
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def professions(realm, character, **options)
        character_request realm, character, 'professions', options
      end

      ##
      # Return character status
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      # @see https://us.forums.blizzard.com/en/blizzard/t/data-protection-notice-and-faq/609
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def status(realm, character, **options)
        character_request realm, character, 'status', options
      end

      ##
      # Return the pvp bracket of a character
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @param bracket [String] Pvp bracket
      # @!macro request_options
      #
      # @!macro response
      def pvp_bracket(realm, character, bracket, **options)
        character_request realm, character, "pvp-bracket/#{bracket}", options
      end

      ##
      # Return the pvp summary of a character
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def pvp_summary(realm, character, **options)
        character_request realm, character, 'pvp-summary', options
      end

      ##
      # Return a character's quests
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #   @option options [Boolean] :completed Should return completed quests
      #
      # @!macro response
      def quests(realm, character, **options)
        completed = options.delete(:completed) || false
        return character_request realm, character, 'quests/completed', options if completed

        character_request realm, character, 'quests', options
      end

      ##
      # Return a character's reputations
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def reputation(realm, character, **options)
        character_request realm, character, 'reputations', options
      end

      ##
      # Return a character's soulbinds
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def soulbinds(realm, character, **options)
        character_request realm, character, 'soulbinds', options
      end

      ##
      # Return a character's specialization
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def specializations(realm, character, **options)
        character_request realm, character, 'specializations', options
      end

      ##
      # Return a character's statistics
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def statistics(realm, character, **options)
        character_request realm, character, 'statistics', options
      end

      ##
      # Return a character's titles
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def titles(realm, character, **options)
        character_request realm, character, 'titles', options
      end

      private

      def default_options(user_token = nil)
        opts = { ttl: CACHE_HOUR, namespace: :profile }
        opts.merge access_token: user_token if user_token
        opts
      end

      def character_request(realm, character, variant = nil, **options)
        uri = "#{base_url(:profile)}/character/#{string_to_slug(realm)}/#{string_to_slug(character)}"
        uri += "/#{variant}" if variant
        api_request uri, default_options.merge(options)
      end
    end
  end
end
