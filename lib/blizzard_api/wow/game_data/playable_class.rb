# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft playable classes
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.playable_class
    class PlayableClass < Wow::GenericDataEndpoint
      setup 'playable-class', :static, CACHE_TRIMESTER

      ##
      # Returns the PvP talent slots data of a specific class
      #
      # @param id [Integer] Class id to fetch talent data. One of the IDs returned by the {index} method
      # @!macro request_options
      #
      # @!macro response
      def talent_slots(id, **options)
        api_request "#{endpoint_uri}/#{id}/pvp-talent-slots", **default_options.merge(options)
      end

      ##
      # Return playable class data by its id
      #
      # @param id [Integer] Playable class id
      #
      # @!macro request_options
      # @option options [Boolean] :classic If set to true, this method will call the classic version
      # @option options [Boolean] :classic1x If set to true, this method will call the classic era version
      #
      # @!macro response
      def get(id, **options)
        data = api_request "#{endpoint_uri}/#{id}", **default_options.merge(options)
        data[:icon] = get_class_icon data[:media], **options
        data
      end

      ##
      # Fetch media for one of the playable classes listed by the {#index} using its *id*
      #
      # @param id [Integer] Playable class id
      #
      # @!macro request_options
      #
      # @!macro response
      def media(id, **options)
        api_request "#{base_url(:media)}/playable-class/#{id}", **default_options.merge(options)
      end

      protected

      def get_class_icon(media_url, **options)
        return if options.include? :classic

        media_data = request media_url[:key][:href], **options
        %r{56/([a-z_]+).jpg}.match(media_data[:assets][0][:value].to_s)[1]
      end
    end
  end
end
