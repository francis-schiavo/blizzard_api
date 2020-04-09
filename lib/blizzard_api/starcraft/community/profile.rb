# frozen_string_literal: true

module BlizzardApi
  module Starcraft
    ##
    # This class allows access to Starcraft II profile data
    #
    # @see https://develop.battle.net/documentation/api-reference/starcraft-2-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Starcraft.profile
    class Profile < Starcraft::Request
      ##
      # Static profile data
      #
      # @!macro sc2_regions
      # @!macro request_options
      def static(region_id, options = {})
        reg = resolve_region(region_id)
        api_request "#{base_url(:community)}/static/profile/#{reg}", { ttl: CACHE_DAY }.merge(options)
      end

      ##
      # Metadata
      #
      # @!macro sc2_regions
      # @param [Integer] realm_id Realm ID
      # @param [Integer] profile_id Profile ID
      # @!macro request_options
      def metadata(region_id, realm_id, profile_id, options = {})
        reg = resolve_region(region_id)
        opts = { ttl: CACHE_DAY }.merge(options)
        api_request "#{base_url(:community)}/metadata/profile/#{reg}/#{realm_id}/#{profile_id}", opts
      end

      ##
      # Profile data
      #
      # @!macro sc2_regions
      # @param [Integer] realm_id Realm ID
      # @param [Integer] profile_id Profile ID
      # @!macro request_options
      def profile(region_id, realm_id, profile_id, options = {})
        reg = resolve_region(region_id)
        opts = { ttl: CACHE_DAY }.merge(options)
        api_request "#{base_url(:community)}/profile/#{reg}/#{realm_id}/#{profile_id}", opts
      end

      ##
      # Ladder summary
      #
      # @!macro sc2_regions
      # @param [Integer] realm_id Realm ID
      # @param [Integer] profile_id Profile ID
      # @!macro request_options
      def ladder_summary(region_id, realm_id, profile_id, options = {})
        reg = resolve_region(region_id)
        opts = { ttl: CACHE_DAY }.merge(options)
        api_request "#{base_url(:community)}profile/#{reg}/#{realm_id}/#{profile_id}/ladder/summary ", opts
      end

      ##
      # Ladder data
      #
      # @!macro sc2_regions
      # @param [Integer] realm_id Realm ID
      # @param [Integer] profile_id Profile ID
      # @!macro request_options
      def ladder(region_id, realm_id, profile_id, ladder_id, options = {})
        reg = resolve_region(region_id)
        opts = { ttl: CACHE_DAY }.merge(options)
        api_request "#{base_url(:community)}/profile/#{reg}/#{realm_id}/#{profile_id}/ladder/#{ladder_id}", opts
      end
    end
  end
end
