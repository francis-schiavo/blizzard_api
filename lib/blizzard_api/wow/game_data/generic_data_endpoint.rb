# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # Generic endpoint to support most data requests with minor configurations
    class GenericDataEndpoint < Wow::Request
      class << self
        attr_accessor :endpoint, :namespace, :ttl

        def setup(endpoint, namespace, ttl)
          self.endpoint = endpoint
          self.namespace = namespace
          self.ttl = ttl
        end
      end

      ##
      # Fetch a list of all resources available for this endpoint
      #
      # @!macro request_options
      # @!macro response
      def index(**options)
        api_request "#{endpoint_uri}/index", **default_options.merge(options)
      end

      ##
      # Fetch all possible data for one of the items listed by the {#index} using its *id*
      #
      # @param id [Integer] One of the IDs returned by the {#index}
      # @!macro request_options
      #
      # @!macro response
      def get(id, **options)
        api_request "#{endpoint_uri}/#{id}", **default_options.merge(options)
      end

      protected

      def endpoint_uri(variant = nil, scope = :game_data)
        endpoint = variant ? "#{self.class.endpoint}-#{variant}" : self.class.endpoint
        "#{base_url(scope)}/#{endpoint}"
      end

      def default_options
        { namespace: self.class.namespace, ttl: self.class.ttl }
      end
    end
  end
end
