# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft playable specializations
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   spec = BlizzardApi::Wow.playable_specialization
    class PlayableSpecialization < Wow::GenericDataEndpoint
      ##
      # @!macro complete
      def complete(**options)
        index_data = index(**options)
        {}.tap do |response_data|
          response_data[:character_specializations] = character_data(index_data, options)
          response_data[:pet_specializations] = pet_data(index_data, options)
        end
      end

      ##
      # Fetch media for one of the playable specializations listed by the {#index} using its *id*
      #
      # @param id [Integer] Playable specialization id
      #
      # @!macro request_options
      #
      # @!macro response
      def media(id, **options)
        api_request "#{base_url(:media)}/playable-specialization/#{id}", **default_options.merge(options)
      end

      protected

      def endpoint_setup
        @endpoint = 'playable-specialization'
        @namespace = :static
        @collection = 'playable_specialization'
        @ttl = CACHE_TRIMESTER
      end

      private

      def character_data(index_data, options)
        [].tap do |specs|
          index_data[:character_specializations].each do |spec|
            spec_id = %r{playable-specialization/([0-9]+)}.match(spec[:key].to_s)[1]
            spec_data = get spec_id, **options
            spec_data[:icon] = resolve_icon(spec_data[:media][:key][:href])
            cleanup spec_data
            specs.push spec_data
          end
        end
      end

      def pet_data(index_data, options)
        [].tap do |specs|
          index_data[:pet_specializations].each do |spec|
            spec_id = %r{playable-specialization/([0-9]+)}.match(spec[:key].to_s)[1]
            spec_data = get spec_id, **options
            spec_data[:icon] = resolve_icon(spec_data[:media][:key][:href])
            cleanup spec_data
            specs.push spec_data
          end
        end
      end

      def cleanup(data)
        data.delete :_links
        data[:playable_class].delete :key
        data.delete :media
      end

      def resolve_icon(media_url)
        media_data = api_request(media_url)
        media_data[:assets][0][:value]
      end
    end
  end
end
