# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # Generic endpoint to support most data requests with minor configurations
    class GenericDataEndpoint < Wow::Request
      ##
      # @!macro regions
      def initialize(region = nil)
        super region
        endpoint_setup
        @ttl ||= CACHE_DAY
      end

      ##
      # Fetch a list of all resources available for this endpoint
      #
      # @!macro request_options
      # @!macro response
      def index(options = {})
        api_request "#{base_url(:game_data)}/#{@endpoint}/index", default_options.merge(options)
      end

      ##
      # Fetch all possible data for one of items listed by the {#index} using its *id*
      #
      # @param id [Integer] One of the IDs returned by the {#index}
      # @!macro request_options
      #
      # @!macro response
      def get(id, options = {})
        api_request "#{base_url(:game_data)}/#{@endpoint}/#{id}", default_options.merge(options)
      end

      ##
      # @!macro complete
      def complete(options = {})
        index_data = index options
        index_data[@collection.to_sym].tap do |collection|
          collection.each do |item|
            item.delete 'key'
          end
        end
      end

      protected

      def endpoint_setup
        raise NotImplementedError, 'You must override this method to properly set up the endpoint'
      end

      def default_options
        { namespace: @namespace, ttl: @ttl }
      end
    end
  end
end
