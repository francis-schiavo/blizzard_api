# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft quest data
    #
    # @see https://develop.battle.net/documentation/world-of-warcraft/game-data-apis
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.quest
    class Quest < Wow::GenericDataEndpoint
      ##
      # Return a list of quest categories
      #
      # @!macro request_options
      #
      # @!macro response
      def categories(**options)
        api_request "#{endpoint_uri}/category/index", default_options.merge(options)
      end

      ##
      # Return data about a quest category
      #
      # @param id [Integer] Quest category id
      # @!macro request_options
      #
      # @!macro response
      def category(id, **options)
        api_request "#{endpoint_uri}/category/#{id}", default_options.merge(options)
      end

      ##
      # Return a list of quest areas
      #
      # @!macro request_options
      #
      # @!macro response
      def areas(**options)
        api_request "#{endpoint_uri}/area/index", default_options.merge(options)
      end

      ##
      # Return data about a quest area
      #
      # @param id [Integer] Quest category id
      # @!macro request_options
      #
      # @!macro response
      def area(id, **options)
        api_request "#{endpoint_uri}/area/#{id}", default_options.merge(options)
      end

      ##
      # Return a list of quest types
      #
      # @!macro request_options
      #
      # @!macro response
      def types(**options)
        api_request "#{endpoint_uri}/type/index", default_options.merge(options)
      end

      ##
      # Return data about a quest type
      #
      # @param id [Integer] Quest type
      # @!macro request_options
      #
      # @!macro response
      def type(id, **options)
        api_request "#{endpoint_uri}/type/#{id}", default_options.merge(options)
      end

      protected

      def endpoint_setup
        @endpoint = 'quest'
        @namespace = :static
        @collection = 'quests'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
