# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # World of Warcraft requests
    class Request < BlizzardApi::Request
      ##
      # @!macro init_options
      def initialize(**options)
        super(**options)
        @game = 'wow'
      end
    end
  end
end
