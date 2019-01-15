# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft guild data
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.guild
    class Guild < Wow::Request
      # Valid fields for guild profile request
      VALID_FIELDS = %w[achievements challenge members news].freeze

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
      #
      # @!macro response
      def get(realm, guild, fields = [], options = {})
        validate_fields fields if options.include? :validate_fields

        opts = { ttl: CACHE_DAY, fields: fields.join(',') }.merge(options)

        api_request "#{base_url(:community)}/guild/#{realm}/#{guild}", opts
      end
    end
  end
end
