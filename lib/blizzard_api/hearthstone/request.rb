# frozen_string_literal: true

module BlizzardApi
  module Hearthstone
    # Hearthstone requests
    class Request < BlizzardApi::Request
      ##
      # @!macro regions
      def initialize(region = nil, mode = :regular)
        super region, mode
        @game = 'hearthstone'
      end
    end
  end
end
