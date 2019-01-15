# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # World of Warcraft requests
    class Request < BlizzardApi::Request
      ##
      # @!macro regions
      def initialize(region = nil)
        super region
        @game = 'wow'
      end
    end
  end
end
