# frozen_string_literal: true

module BlizzardApi
  module Starcraft
    ##
    # This class allows access to Starcraft II legacy data
    #
    # @see https://develop.battle.net/documentation/api-reference/starcraft-2-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Starcraft.legacy
    class Legacy < Starcraft::Request
      
      ##
      # Profile data
      #
      # @!macro sc2_regions
      # @param [Integer] realm_id Realm ID
      # @param [Integer] profile_id Profile ID
      # @!macro request_options
      def profile(region_id, realm_id, profile_id, **options)
        reg = resolve_region(region_id)
        opts = { ttl: CACHE_DAY }.merge(options)
        api_request "#{base_url(:community)}/legacy/profile/#{reg}/#{realm_id}/#{profile_id}", opts
      end

      ##
      # Ladders
      #
      # @!macro sc2_regions
      # @param [Integer] realm_id Realm ID
      # @param [Integer] profile_id Profile ID
      # @!macro request_options
      def ladders(region_id, realm_id, profile_id, **options)
        reg = resolve_region(region_id)
        opts = { ttl: CACHE_DAY }.merge(options)
        api_request "#{base_url(:community)}/legacy/profile/#{reg}/#{realm_id}/#{profile_id}/ladder ", opts
      end

      ##
      # Match History
      #
      # @!macro sc2_regions
      # @param [Integer] realm_id Realm ID
      # @param [Integer] profile_id Profile ID
      # @!macro request_options
      def match(region_id, realm_id, profile_id, **options)
        reg = resolve_region(region_id)
        opts = { ttl: CACHE_DAY }.merge(options)
        api_request "#{base_url(:community)}/legacy/profile/#{reg}/#{realm_id}/#{profile_id}/matches", opts
      end
      
      ##
      # Ladder
      #
      # @!macro sc2_regions
      # @param [Integer] ladder_id Ladder ID
      # @!macro request_options
      def ladder(region_id, ladder_id, **options)
        reg = resolve_region(region_id)
        opts = { ttl: CACHE_DAY }.merge(options)
        api_request "#{base_url(:community)}/legacy/ladder/#{reg}/#{ladder_id}", opts
      end
      
      ##
      # Achievement data
      #
      # @!macro sc2_regions
      # @!macro request_options
      def achievements(region_id, **options)
        reg = resolve_region(region_id)
        opts = { ttl: CACHE_DAY }.merge(options)
        api_request "#{base_url(:community)}/legacy/data/achievements/#{reg}", opts
      end
      
      ##
      # Rewards data
      #
      # @!macro sc2_regions
      # @!macro request_options
      def rewards(region_id, **options)
        reg = resolve_region(region_id)
        opts = { ttl: CACHE_DAY }.merge(options)
        api_request "#{base_url(:community)}/legacy/data/rewards/#{reg}", opts
      end
    end
  end
end
