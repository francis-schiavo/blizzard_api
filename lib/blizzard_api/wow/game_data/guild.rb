# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft guild data
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.guild
    class Guild < Wow::Request
      # Valid fields for guild profile request
      VALID_FIELDS = %w[achievements achievementsCompleted achievementsCompletedTimestamp criteria criteriaCreated
                        criteriaQuantity criteriaTimestamp challenge members news].freeze

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
      # Return a list with all possible rewards.
      #
      # @!macro request_options
      #
      # @!macro response
      def rewards(options = {})
        api_request "#{base_url(:community)}/data/guild/rewards", { ttl: CACHE_TRIMESTER }.merge(options)
      end

      ##
      # Return a list with all possible perks
      #
      # @!macro request_options
      #
      # @!macro response
      def perks(options = {})
        api_request "#{base_url(:community)}/data/guild/perks", { ttl: CACHE_TRIMESTER }.merge(options)
      end

      ##
      # Return data about the specified guild
      #
      # @param realm [String] The guild realm's slug
      # @param guild [String] The guild's name
      # @param fields [Array<String>] An array containing all the fields you want to be included in the response.
      # @!macro request_options
      # @option options [Boolean] :use_community_endpoint If set to true, this method will call the community endpoint
      #   instead of the data endpoint https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
      #
      # @!macro response
      def get(realm, guild, options = {}, fields = [])
        return guild_request(realm, guild, options) unless options.include? :use_community_endpoint

        validate_fields fields if options.include? :validate_fields
        opts = { ttl: CACHE_DAY, fields: fields.join(',') }.merge(options)
        api_request "#{base_url(:community)}/guild/#{CGI.escape(realm)}/#{CGI.escape(guild)}", opts
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
      # @option options [Boolean] :use_community_endpoint If set to true, this method will call the community endpoint
      #   instead of the data endpoint https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
      #
      # @!macro response
      def achievements(realm, guild, options = {})
        if options.include? :use_community_endpoint
          return api_request "#{base_url(:community)}/data/guild/achievements", { ttl: CACHE_TRIMESTER }.merge(options)
        end

        guild_request realm, guild, options, 'achievements'
      end

      private

      def guild_request(realm, guild, options = {}, variant = nil)
        realm = CGI.escape string_to_slug(realm)
        guild = CGI.escape string_to_slug(guild)
        url = "#{base_url(:game_data)}/guild/#{realm}/#{guild}"
        url += "/#{variant}" if variant
        api_request url, { ttl: CACHE_DAY, namespace: endpoint_namespace(:profile) }.merge(options)
      end
    end
  end
end
