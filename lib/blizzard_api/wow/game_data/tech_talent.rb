# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft talent data
    #
    # @see https://develop.battle.net/documentation/world-of-warcraft/game-data-apis
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.talent
    class TechTalent < Wow::GenericDataEndpoint
      ##
      # Fetch tech talent trees
      #
      # @!macro request_options
      #
      # @!macro response
      def tech_talent_trees(**options)
        api_request "#{base_url(:game_data)}/tech-talent-tree/index", **default_options.merge(options)
      end

      ##
      # Fetch a tech talent tree
      #
      # @param id [Integer] Tech talent id
      #
      # @!macro request_options
      #
      # @!macro response
      def tech_talent_tree(id, **options)
        api_request "#{base_url(:game_data)}/tech-talent-tree/#{id}", **default_options.merge(options)
      end

      ##
      # Fetch a tech talent media
      #
      # @param id [Integer] Tech talent id
      #
      # @!macro request_options
      #
      # @!macro response
      def media(id, **options)
        api_request "#{base_url(:media)}/tech-talent/#{id}", **default_options.merge(options)
      end

      protected

      def endpoint_setup
        @endpoint = 'tech-talent'
        @namespace = :static
        @collection = 'tech-talents'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
