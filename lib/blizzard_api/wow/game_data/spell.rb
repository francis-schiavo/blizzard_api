# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft spell data
    #
    # @see https://develop.battle.net/documentation/world-of-warcraft/game-data-apis
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.spell
    class Spell < Wow::GenericDataEndpoint
      include BlizzardApi::Wow::Searchable

      setup 'spell', :static, CACHE_TRIMESTER

      ##
      # This method overrides the inherited default behavior to prevent high server load and fetch time
      #
      # @!macro response
      def index
        raise BlizzardApi::ApiException, 'This endpoint does not have an index method'
      end

      ##
      # Fetch media for a spell
      #
      # @param id [Integer] Spell id
      #
      # @!macro request_options
      #
      # @!macro response
      def display_media(id, **options)
        api_request "#{base_url(:media)}/spell/#{id}", **default_options.merge(options)
      end
    end
  end
end
