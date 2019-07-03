# frozen_string_literal: true

module BlizzardApi
  module Diablo
    # Diablo III requests
    class Request < BlizzardApi::Request
      ##
      # @!macro regions
      def initialize(region = nil)
        super region
        @game = 'd3'
      end
    end
  end
end
