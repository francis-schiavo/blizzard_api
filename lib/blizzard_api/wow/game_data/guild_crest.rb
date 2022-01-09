# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft guild crest data
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.guild_crest
    class GuildCrest < Wow::GenericDataEndpoint
      setup 'guild-crest', :static, CACHE_TRIMESTER

      def get
        raise BlizzardApi::ApiException, 'This endpoint doens\'t have a get method'
      end

      ##
      # Return guild border assets by its id
      #
      # @param id [Integer] Border id
      #
      # @!macro request_options
      # @option options [Boolean] :classic If set to true, this method will call the classic version
      # @option options [Boolean] :classic1x If set to true, this method will call the classic era version
      #
      # @!macro response
      def border_media(id, **options)
        api_request "#{base_url(:media)}/#{self.class.endpoint}/border/#{id}", **default_options.merge(options)
      end

      ##
      # Return guild embelm assets by its id
      #
      # @param id [Integer] Emblem id
      # @option options [Boolean] :classic If set to true, this method will call the classic version
      # @option options [Boolean] :classic1x If set to true, this method will call the classic era version
      #
      # @!macro request_options
      #
      # @!macro response
      def emblem_media(id, **options)
        api_request "#{base_url(:media)}/#{self.class.endpoint}/emblem/#{id}", **default_options.merge(options)
      end
    end
  end
end
