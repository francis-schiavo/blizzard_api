# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # Added search support to an endpoint
    module Searchable
      ##
      # Fetch data based on search criteria
      #
      # @param page [Integer] Page o return
      # @param page_size [Integer] Amount of items per page
      #
      # @!macro request_options
      # @!macro response
      def search(page = 1, page_size = 100, options = {})
        search_options = SearchComposer.new(page, page_size)
        yield search_options if block_given?

        api_request "#{endpoint_uri(nil, :search)}?#{search_options.to_search_query}", default_options.merge(options)
      end
    end
  end
end
