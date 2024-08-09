# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # Simplifies the requests to Blizzard APIS
    class AccountProfile < Request
      ##
      # @param token [String] A token obtained using the authorization_code flow
      def initialize(token, **options)
        super(**options)
        @token = token
      end

      ##
      # Returns the account summary for WoW
      #
      # @!macro request_options
      #
      # @!macro response
      def get(**options)
        api_request base_url(:user_profile).to_s, **default_options.merge(options)
      end

      ##
      # Returns data for protected characters
      #
      # @!macro request_options
      #
      # @!macro response
      def protected_character(realm_id, character_id, **options)
        api_request "#{base_url(:user_profile)}/protected-character/#{realm_id}-#{character_id}", **default_options.merge(options)
      end

      ##
      # Returns the collection index for the account
      #
      # @!macro request_options
      #
      # @!macro response
      def collections(**options)
        api_request "#{base_url(:user_profile)}/collections", **default_options.merge(options)
      end
      alias collection collections

      ##
      # Returns the mount collection index for the account
      #
      # @!macro request_options
      #
      # @!macro response
      def mounts(**options)
        api_request "#{base_url(:user_profile)}/collections/mounts", **default_options.merge(options)
      end

      ##
      # Returns the toy collection index for the account
      #
      # @!macro request_options
      #
      # @!macro response
      def toys(**options)
        api_request "#{base_url(:user_profile)}/collections/toys", **default_options.merge(options)
      end

      ##
      # Returns the heirloom collection index for the account
      #
      # @!macro request_options
      #
      # @!macro response
      def heirloom(**options)
        api_request "#{base_url(:user_profile)}/collections/heirloom", **default_options.merge(options)
      end

      ##
      # Returns the pet collection index for the account
      #
      # @!macro request_options
      #
      # @!macro response
      def pets(**options)
        api_request "#{base_url(:user_profile)}/collections/pets", **default_options.merge(options)
      end

      ##
      # Returns the transmogs collection index for the account
      #
      # @!macro request_options
      #
      # @!macro response
      def transmogs(**options)
        api_request "#{base_url(:user_profile)}/collections/transmogs", **default_options.merge(options)
      end

      protected

      def default_options
        { ttl: CACHE_HOUR, namespace: :profile }
      end

      def api_request(_uri, **query_string)
        query_string.merge! access_token: @token
        super
      end
    end
  end
end
