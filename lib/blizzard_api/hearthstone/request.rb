# frozen_string_literal: true

module BlizzardApi
  module Hearthstone
    # Hearthstone requests
    class Request < BlizzardApi::Request
      ##
      # @!macro init_options
      def initialize(**options)
        super(**options)
        @game = 'hearthstone'
      end
    end
  end
end
