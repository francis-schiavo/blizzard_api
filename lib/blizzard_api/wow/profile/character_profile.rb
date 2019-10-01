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
      # Valid fields for character profile requests
      VALID_FIELDS = %w[
        achievements
        appearance
        feed
        guild
        hunterPets
        items
        mounts
        pets
        petSlots
        professions
        progression
        pvp
        quests
        reputation
        statistics
        stats
        talents
        titles
        audit
      ].freeze

      ##
      # Helper method for checking valid fields. Use this to validate an array of fields if you are not sure about their
      # names.
      #
      # @param fields [Array<String>] Array containing desired fields to include
      #
      # @raise ArgumentError
      def validate_fields(fields)
        fields.each do |field|
          raise ArgumentError, "Unrecognized field #{field}" unless VALID_FIELDS.include? field
        end
      end

      ##
      # Return a list containing all WoW characters of a BNet account
      #
      # @note This endpoint requires a user token obtained through the user authorization flow
      # @see https://develop.battle.net/documentation/guides/using-oauth/authorization-code-flow
      #
      # @param user_token [String] A token obtained by the authorization flow. See link below.
      # @!macro request_options
      #
      # @!macro response
      def get_user_characters(user_token, options = {})
        opts = { ttl: CACHE_HOUR, access_token: user_token }.merge(options)
        api_request "#{base_url(:community)}/user/characters", opts
      end

      ##
      # Return character achievements
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @param fields [Array<String>] An array containing all the fields you want to be included in the response. Only
      #   used for community endpoint.
      # @!macro request_options
      # @option options [Boolean] :use_community_endpoint If set to true, this method will call the community endpoint
      #   instead of the data endpoint https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
      #
      # @!macro response
      def get(realm, character, fields = [], options = {})
        return character_request realm, character, options unless options.include? :use_community_endpoint

        validate_fields fields if options.include? :validate_fields
        opts = { ttl: CACHE_DAY, fields: fields.join(',') }.merge(options)
        api_request "#{base_url(:community)}/character/#{CGI.escape(realm)}/#{CGI.escape(character)}", opts
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
      def status(realm, character, options = {})
        character_request realm, character, options, 'status'
      end

      ##
      # Return character achievements
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      # @option options [Boolean] :use_community_endpoint If set to true, this method will call the community endpoint
      #   instead of the data endpoint https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
      #
      # @!macro response
      def achievements(realm, character, options = {})
        return character_request realm, character, options, 'achievements' unless options.include? :use_community_endpoint

        api_request "#{base_url(:community)}/data/guild/achievements", { ttl: CACHE_TRIMESTER }.merge(options)
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
      def appearance(realm, character, options = {})
        character_request realm, character, options, 'appearance'
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
      def equipment(realm, character, options = {})
        character_request realm, character, options, 'equipment'
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
      def media(realm, character, options = {})
        character_request realm, character, options, 'character-media'
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
      def pvp_bracket(realm, character, bracket, options = {})
        character_request realm, character, options, "pvp-bracket/#{bracket}"
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
      def pvp_summary(realm, character, options = {})
        character_request realm, character, options, 'pvp-summary'
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
      def specializations(realm, character, options = {})
        character_request realm, character, options, 'specializations'
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
      def statistics(realm, character, options = {})
        character_request realm, character, options, 'statistics'
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
      def titles(realm, character, options = {})
        character_request realm, character, options, 'titles'
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
      def mythic_keystone_profile(realm, character, options = {})
        character_request realm, character, options, 'mythic-keystone-profile'
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
      def mythic_keystone_seasons(realm, character, season = nil, options = {})
        character_request realm, character, options, "mythic-keystone-profile/season/#{season}"
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
      def collections(realm, character, options = {})
        character_request realm, character, options, 'collections'
      end

      ##
      # Return a character's raid progression
      #
      # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-profile-api
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @!macro request_options
      #
      # @!macro response
      def raid_progression(realm, character, options = {})
        character_request realm, character, options, 'raid-progression'
      end

      private

      def default_options(user_token = nil)
        opts = { ttl: CACHE_HOUR, namespace: :profile }
        opts.merge access_token: user_token if user_token
        opts
      end

      def character_request(realm, character, options = {}, variant = nil)
        uri = "#{base_url(:profile)}/character/#{CGI.escape(realm.downcase)}/#{CGI.escape(character.downcase)}"
        uri += "/#{variant}" if variant
        api_request uri, default_options.merge(options)
      end
    end
  end
end
