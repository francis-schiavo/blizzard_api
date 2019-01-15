# frozen_string_literal: true

module BlizzardApi
  module Diablo
    ##
    # This class allows access to Diablo III character data
    #
    # @see https://develop.battle.net/documentation/api-reference/diablo-3-community-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Diablo.character
    class Character < BlizzardApi::Diablo::Request
      ##
      # Return information about a class
      #
      # @param class_slug [String] Class slug
      # @!macro request_options
      #
      # @!macro response
      def get(class_slug, options = {})
        api_request "#{base_url(:community)}/data/hero/#{class_slug}", { ttl: CACHE_TRIMESTER }.merge(options)
      end

      ##
      # Return information about a class' skill
      #
      # @param class_slug [String] Class slug
      # @param skill_slug [String] Skill slug
      # @!macro request_options
      #
      # @!macro response
      def skill(class_slug, skill_slug, options = {})
        opts = { ttl: CACHE_TRIMESTER }.merge(options)
        api_request "#{base_url(:community)}/data/hero/#{class_slug}/skill/#{skill_slug}", opts
      end
    end
  end
end
