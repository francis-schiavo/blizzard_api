# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft pet data
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.pet
    class Pet < Wow::GenericDataEndpoint
      # Poor (gray) quality pet
      PET_QUALITY_POOR = 0
      # Common (white) quality pet
      PET_QUALITY_COMMON = 1
      # Uncommon (green) quality pet
      PET_QUALITY_UNCOMMON = 2
      # Rare (blue) quality pet
      PET_QUALITY_RARE = 3
      # Epic (purple) quality pet
      PET_QUALITY_EPIC = 4
      # Legendary (orange) quality pet
      PET_QUALITY_LEGENDARY = 5

      ##
      # Return a list of all available pets
      #
      # @!macro request_options
      # @option options [Boolean] :use_community_endpoint If set to true, this method will call the community endpoint
      #   instead of the data endpoint https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
      #
      # @!macro response
      def index(options = {})
        return super options unless options.include? :use_community_endpoint

        api_request "#{base_url(:community)}/pet/", { ttl: CACHE_TRIMESTER }.merge(options)
      end

      ##
      # Return complete data about a pet ability by its id
      #
      # @param id [Integer] Pet ability id
      # @!macro request_options
      #
      # @!macro response
      def ability(id, options = {})
        api_request "#{base_url(:community)}/pet/ability/#{id}", { ttl: CACHE_TRIMESTER }.merge(options)
      end

      ##
      # Return complete data about a pet species by its id
      #
      # @param id [Integer] Pet species id
      # @!macro request_options
      #
      # @!macro response
      def species(id, options = {})
        api_request "#{base_url(:community)}/pet/species/#{id}", { ttl: CACHE_TRIMESTER }.merge(options)
      end

      ##
      # Return complete data about a pet stats based on its attributes
      #
      # @param id [Integer] Pet id (Obtained by the {#index} or {Character#get} with the fields *pets* or *petSlots*)
      # @param level [Integer] Pet's level (1 - 25)
      # @param breed_id [Integer]
      # @param quality_id [Integer] Pets quality ID where 0 = Poor and 5 = legendary. You can use the
      # constants PET_QUALITY_*
      # @!macro request_options
      #
      # @!macro response
      def stats(id, level = 25, breed_id = 3, quality_id = 1, options = {})
        opts = { level: level, breedId: breed_id, qualityId: quality_id, ttl: CACHE_TRIMESTER }.merge(options)
        api_request "#{base_url(:community)}/pet/stats/#{id}", opts
      end

      ##
      # Return a complete list of pet types
      #
      # @!macro request_options
      #
      # @!macro response
      def types(options = {})
        api_request "#{base_url(:community)}/data/pet/types", { ttl: CACHE_TRIMESTER }.merge(options)
      end

      protected

      def endpoint_setup
        @endpoint = 'pet'
        @namespace = :static
        @collection = 'pets'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
