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
    class Talent < Wow::GenericDataEndpoint
      setup 'talent', :static, CACHE_TRIMESTER

      ##
      # Fetch talent trees
      #
      # @!macro request_options
      #
      # @!macro response
      def talent_trees(**options)
        api_request "#{base_url(:game_data)}/talent-tree/index", **default_options.merge(options)
      end

      ##
      # Fetch a talent tree
      #
      # @param talent_tree_id [Integer] talent tree id
      #
      # @param spec_id [Integer] playable specialization id
      #
      # @!macro request_options
      #
      # @!macro response
      def talent_tree(talent_tree_id, spec_id, **options)
        api_request "#{base_url(:game_data)}/talent-tree/#{talent_tree_id}/playable-specialization/#{spec_id}", **default_options.merge(options)
      end

      ##
      # Fetch pvp talents
      #
      # @!macro request_options
      #
      # @!macro response
      def pvp_talents(**options)
        api_request "#{base_url(:game_data)}/pvp-talent/index", **default_options.merge(options)
      end

      ##
      # Fetch a pvp talent
      #
      # @param id [Integer] Pvp talent id
      #
      # @!macro request_options
      #
      # @!macro response
      def pvp_talent(id, **options)
        api_request "#{base_url(:game_data)}/pvp-talent/#{id}", **default_options.merge(options)
      end
    end
  end
end
