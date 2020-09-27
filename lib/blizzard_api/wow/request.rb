# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # World of Warcraft requests
    class Request < BlizzardApi::Request
      ##
      # @!macro regions
      def initialize(region = nil, mode = :regular)
        super region, mode
        @game = 'wow'
      end
    end
  end
end
