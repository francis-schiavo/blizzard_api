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
      def achievements(realm, character, options = {})
        api_request "#{endpoint_uri(realm, character)}/achievements", default_options.merge(options)
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
        api_request "#{endpoint_uri(realm, character)}/appearance", default_options.merge(options)
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
        api_request "#{endpoint_uri(realm, character)}/equipment", default_options.merge(options)
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
        api_request "#{endpoint_uri(realm, character)}/character-media", default_options.merge(options)
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
        api_request "#{endpoint_uri(realm, character)}/pvp-bracket/#{bracket}", default_options.merge(options)
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
        api_request "#{endpoint_uri(realm, character)}/pvp-summary", default_options.merge(options)
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
        api_request "#{endpoint_uri(realm, character)}/specializations", default_options.merge(options)
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
        api_request "#{endpoint_uri(realm, character)}/statistics", default_options.merge(options)
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
        api_request "#{endpoint_uri(realm, character)}/titles", default_options.merge(options)
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
      def keystone_profile(realm, character, options = {})
        api_request "#{endpoint_uri(realm, character)}/mythic-keystone-profile", default_options.merge(options)
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
      def keystone_season_details(realm, character, season = nil, options = {})
        api_request api_request "#{endpoint_uri(realm, character)}/mythic-keystone-profile/season/#{season}",
                                default_options.merge(options)
      end

      private

      def default_options(user_token = nil)
        opts = { ttl: CACHE_HOUR, namespace: endpoint_namespace(:profile) }
        opts.merge access_token: user_token if user_token
        opts
      end

      def endpoint_uri(realm, character)
        "#{base_url(:profile)}/character/#{CGI.escape(realm)}/#{CGI.escape(character)}"
      end
    end
  end
end
