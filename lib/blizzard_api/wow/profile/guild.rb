# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft guild data
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.guild
    class Guild < Wow::Request
      include BlizzardApi::Wow::Slug

      ##
      # Return data about the specified guild
      #
      # @param realm [String] The guild realm's slug
      # @param guild [String] The guild's name
      # @!macro request_options
      #
      # @!macro response
      def get(realm, guild, options = {})
        guild_request(realm, guild, options)
      end

      ##
      # Return all guild members for a specified guild
      #
      # @param realm [String] The guild realm's slug
      # @param guild [String] The guild's name
      #
      # @!macro request_options
      #
      # @!macro response
      def roster(realm, guild, options = {})
        guild_request realm, guild, options, 'roster'
      end

      ##
      # Return all guild achievements for a specified guild
      #
      # @param realm [String] The guild realm's slug
      # @param guild [String] The guild's name
      # @!macro request_options
      #
      # @!macro response
      def achievements(realm, guild, options = {})
        guild_request realm, guild, options, 'achievements'
      end

      ##
      # Return guild activity
      #
      # @param realm [String] The guild realm's slug
      # @param guild [String] The guild's name
      # @!macro request_options
      #
      # @!macro response
      def activity(realm, guild, options = {})
        guild_request realm, guild, options, 'activity'
      end

      private

      def guild_request(realm, guild, options = {}, variant = nil)
        realm = string_to_slug(realm)
        guild = string_to_slug(guild)
        url = "#{base_url(:game_data)}/guild/#{realm}/#{guild}"
        url += "/#{variant}" if variant
        api_request url, { ttl: CACHE_DAY, namespace: :profile }.merge(options)
      end
    end
  end
end
