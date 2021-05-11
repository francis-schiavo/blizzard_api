# frozen_string_literal: true

module BlizzardApi
  module Diablo
    ##
    # This class allows access to Diablo III artisan data
    #
    # @see https://develop.battle.net/documentation/api-reference/diablo-3-community-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Diablo.artisan
    class Artisan < BlizzardApi::Diablo::Request
      ##
      # Return data about an artisan by its slug
      #
      # @param artisan_slug [String] Artisan slug
      # @!macro request_options
      #
      # @!macro response
      def get(artisan_slug, **options)
        api_request "#{base_url(:community)}/data/artisan/#{artisan_slug}", **{ ttl: CACHE_TRIMESTER }.merge(options)
      end

      ##
      # Return data about an artisan recipe
      #
      # @param artisan_slug [String] Artisan slug
      # @param recipe_slug [String] Recipe slug
      # @!macro request_options
      #
      # @!macro response
      def recipe(artisan_slug, recipe_slug, **options)
        opts = { ttl: CACHE_TRIMESTER }.merge(options)
        api_request "#{base_url(:community)}/data/artisan/#{artisan_slug}/recipe/#{recipe_slug}", **opts
      end
    end
  end
end
