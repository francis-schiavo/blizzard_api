# frozen_string_literal: true

module BlizzardApi
  module Diablo
    # Generic endpoint to support most data requests with minor configurations
    class GenericDataEndpoint < Diablo::Request
      def initialize(region = nil)
        super region
        endpoint_setup
        @ttl ||= CACHE_DAY
      end

      ##
      # Get information about the resource
      #
      # @!macro request_options
      #
      # @!macro response
      def index(options = {})
        api_request "#{base_url(:game_data)}/#{@endpoint}/", default_options.merge(options)
      end

      ##
      # Fetch all possible data for one of items listed by the {#index} using its *id*
      #
      # @param [Integer] id One of the IDs returned by the {#index}
      # @!macro request_options
      #
      # @!macro response
      def get(id, options = {})
        api_request "#{base_url(:game_data)}/#{@endpoint}/#{id}", default_options.merge(options)
      end

      ##
      # Fetch leaderboard data for the current endpoint
      #
      # @param [Integer] id One of the IDs returned by the {index}
      # @param [Integer] leaderboard_id Leaderboard id
      # @!macro request_options
      #
      # @!macro response
      def leaderboard(id, leaderboard_id, options = {})
        opts = default_options.merge(options)
        api_request "#{base_url(:game_data)}/#{@endpoint}/#{id}/leaderboard/#{leaderboard_id}", opts
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
