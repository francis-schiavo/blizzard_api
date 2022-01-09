# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft professions
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.profession
    class Profession < Wow::GenericDataEndpoint
      setup 'profession', :static, CACHE_TRIMESTER

      ##
      # Fetch media for a profession using its *id*
      #
      # @param id [Integer] Profession id
      #
      # @!macro request_options
      #
      # @!macro response
      def media(id, **options)
        api_request "#{base_url(:media)}/profession/#{id}", **default_options.merge(options)
      end

      ##
      # Fetch skill tier for a profession using its *ids*
      #
      # @param id [Integer] Profession id
      # @param tier_id [Integer] Profession skill tier id
      #
      # @!macro request_options
      #
      # @!macro response
      def skill_tier(id, tier_id, **options)
        api_request "#{base_url(:game_data)}/profession/#{id}/skill-tier/#{tier_id}", **default_options.merge(options)
      end

      ##
      # Fetch data for a recipe using its *ids*
      #
      # @param id [Integer] Recipe id
      #
      # @!macro request_options
      #
      # @!macro response
      def recipe(id, **options)
        api_request "#{base_url(:game_data)}/recipe/#{id}", **default_options.merge(options)
      end

      ##
      # Fetch media for a recipe using its *ids*
      #
      # @param id [Integer] Recipe id
      #
      # @!macro request_options
      #
      # @!macro response
      def recipe_media(id, **options)
        api_request "#{base_url(:media)}/recipe/#{id}", **default_options.merge(options)
      end
    end
  end
end
