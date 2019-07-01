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
      # Return the mythic keystone profile of a character
      #
      # @note This endpoint requires a user token obtained through the user authorization flow
      # @see https://develop.battle.net/documentation/guides/using-oauth/authorization-code-flow
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @param user_token [String] A token obtained by the authorization flow. See link below.
      # @param season [Integer] Season ID if you want only a specific season or nil to include all.
      # @!macro request_options
      #
      # @!macro response
      def get_keystone_profile(realm, character, user_token, season = nil, options = {})
        url = "#{endpoint_uri(realm, character)}/mythic-keystone-profile"
        url += "/season/#{season}" unless season.nil?
        api_request url, default_options(user_token).merge(options)
      end

      ##
      # Return the pvp summary of a character
      #
      # @note This endpoint requires a user token obtained through the user authorization flow
      # @see https://develop.battle.net/documentation/guides/using-oauth/authorization-code-flow
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @param user_token [String] A token obtained by the authorization flow. See link below.
      # @!macro request_options
      #
      # @!macro response
      def pvp_summmary(realm, character, user_token, options = {})
        api_request "#{endpoint_uri(realm, character)}/pvp-summary", default_options(user_token).merge(options)
      end

      ##
      # Return the pvp bracket of a character
      #
      # @note This endpoint requires a user token obtained through the user authorization flow
      # @see https://develop.battle.net/documentation/guides/using-oauth/authorization-code-flow
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @param bracket [String] Pvp bracket
      # @param user_token [String] A token obtained by the authorization flow. See link below.
      # @!macro request_options
      #
      # @!macro response
      def pvp_bracket(realm, character, bracket, user_token, options = {})
        api_request "#{endpoint_uri(realm, character)}/pvp-bracket/#{bracket}",
                    default_options(user_token).merge(options)
      end

      private

      def default_options(user_token)
        { ttl: CACHE_HOUR, namespace: endpoint_namespace(:profile), access_token: user_token }
      end

      def endpoint_uri(realm, character)
        "#{base_url(:profile)}/character/#{CGI.escape(realm)}/#{CGI.escape(character)}"
      end
    end
  end
end
