# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft professions
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.modified_crafting
    class ModifiedCrafting < Wow::GenericDataEndpoint
      setup 'modified-crafting', :static, CACHE_TRIMESTER

      def get(_id, **_options)
        raise BlizzardApi::ApiException, 'This endpoint does not have a get method'
      end

      ##
      # Fetch modified crafting category index
      #
      # @!macro request_options
      def categories(**options)
        api_request "#{base_url(:game_data)}/modified-crafting/category/index", **default_options.merge(options)
      end

      ##
      # Fetch a modified crafting category
      #
      # @param id [Integer] Modified crafting category id
      #
      # @!macro request_options
      #
      # @!macro response
      def category(id, **options)
        api_request "#{base_url(:game_data)}/modified-crafting/category/#{id}", **default_options.merge(options)
      end

      ##
      # Fetch modified crafting slot type index
      #
      # @!macro request_options
      def slot_types(**options)
        api_request "#{base_url(:game_data)}/modified-crafting/reagent-slot-type/index", **default_options.merge(options)
      end

      ##
      # Fetch a modified crafting slot type
      #
      # @param id [Integer] Modified crafting slot type id
      #
      # @!macro request_options
      #
      # @!macro response
      def slot_type(id, **options)
        api_request "#{base_url(:game_data)}/modified-crafting/reagent-slot-type/#{id}", **default_options.merge(options)
      end
    end
  end
end
