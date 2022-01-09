# frozen_string_literal: true

module BlizzardApi
  module Diablo
    # Diablo III requests
    class Request < BlizzardApi::Request
      ##
      # @!macro init_options
      def initialize(**options)
        super(**options)
        @game = 'd3'
      end
    end
  end
end
