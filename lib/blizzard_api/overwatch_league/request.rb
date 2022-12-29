# frozen_string_literal: true

module BlizzardApi
  module OverwatchLeague
    # Overwatch League requests
    class Request < BlizzardApi::Request
      ##
      # @!macro init_options
      def initialize(**options)
        super(**options)
        @game = 'owl'
      end
    end
  end
end
