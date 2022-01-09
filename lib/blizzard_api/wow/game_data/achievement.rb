# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft achievements
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.achievement
    class Achievement < Wow::GenericDataEndpoint
      setup 'achievement', :static, CACHE_TRIMESTER

      ##
      # Return a list of possible achievement categories.
      #
      # @!macro request_options
      #
      # @!macro response
      def categories(**options)
        api_request "#{endpoint_uri('category')}/index", **default_options.merge(options)
      end

      ##
      # Return a achievement category.
      #
      # @!macro request_options
      #
      # @!macro response
      def category(id, **options)
        api_request "#{endpoint_uri('category')}/#{id}", **default_options.merge(options)
      end

      ##
      # Fetch media assets for the specified achievement
      #
      # @!macro request_options
      #
      # @!macro response
      def media(id, **options)
        api_request "#{base_url(:media)}/achievement/#{id}", **default_options.merge(options)
      end
    end
  end
end
