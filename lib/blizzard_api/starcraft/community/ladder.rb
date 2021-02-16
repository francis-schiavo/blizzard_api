# frozen_string_literal: true

module BlizzardApi
  module Starcraft
    ##
    # This class allows access to Starcraft II ladder data
    #
    # @see https://develop.battle.net/documentation/api-reference/starcraft-2-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Starcraft.ladder
    class Ladder < Starcraft::Request
      ##
      # Grandmaster endpoint
      #
      # @!macro sc2_regions
      # @!macro request_options
      def grandmaster(region_id, **options)
        reg = resolve_region(region_id)
        api_request "#{base_url(:community)}/ladder/grandmaster/#{reg}", { ttl: CACHE_DAY }.merge(options)
      end

      ##
      # Season endpoint
      #
      # @!macro sc2_regions
      # @!macro request_options
      def season(region_id, **options)
        reg = resolve_region(region_id)
        api_request "#{base_url(:community)}/ladder/season/#{reg}", { ttl: CACHE_DAY }.merge(options)
      end
    end
  end
end
