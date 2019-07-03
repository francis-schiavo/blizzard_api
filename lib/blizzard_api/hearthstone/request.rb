# frozen_string_literal: true

module BlizzardApi
  module Hearthstone
    # Hearthstone requests
    class Request < BlizzardApi::Request
      ##
      # @!macro regions
      def initialize(region = nil)
        super region
        @game = 'hearthstone'
      end
    end
  end
end
