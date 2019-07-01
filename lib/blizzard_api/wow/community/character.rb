# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft character data
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.character
    class Character < Wow::Request
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
      # Return data about the specified char
      #
      # @param realm [String] The character realm's slug
      # @param character [String] The character name
      # @param fields [Array<String>] An array containing all the fields you want to be included in the response.
      # @!macro request_options
      #
      # @!macro response
      def get(realm, character, fields = [], options = {})
        validate_fields fields if options.include? :validate_fields

        opts = { ttl: CACHE_DAY, fields: fields.join(',') }.merge(options)

        api_request "#{base_url(:community)}/character/#{CGI.escape(realm)}/#{CGI.escape(character)}", opts
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
    end
  end
end
