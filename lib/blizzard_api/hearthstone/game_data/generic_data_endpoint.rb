# frozen_string_literal: true

module BlizzardApi
  module Hearthstone
    # Generic endpoint to support most data requests with minor configurations
    class GenericDataEndpoint < Hearthstone::Request
      def initialize(**options)
        super(**options)
        endpoint_setup
        @ttl ||= CACHE_DAY
      end

      ##
      # Using :community base_url as that's where Blizzard's endpoint resides
      # Also in the game_data folder as they have labeled it "Hearthstone Game Data APIs"

      ##
      # Get information about the resource
      #
      # @!macro request_options
      #
      # @!macro response
      def search(**options)
        api_request "#{base_url(:community)}/#{@endpoint}/", **default_options.merge(options)
      end

      ##
      # Fetch all possible data for one of items listed by the {#index} using its *id*
      #
      # @param [Integer|String] id One of the IDs returned by the {#index}
      # @!macro request_options
      #
      # @!macro response
      def get(id, **options)
        api_request "#{base_url(:community)}/#{@endpoint}/#{id}", **default_options.merge(options)
      end

      protected

      def endpoint_setup
        raise NotImplementedError
      end

      def default_options
        { ttl: @ttl }
      end
    end
  end
end
