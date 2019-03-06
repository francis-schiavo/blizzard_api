# frozen_string_literal: true

module BlizzardApi
  ##
  # API Exception
  class ApiException < RuntimeError
    attr_reader :code

    def initialize(msg = '', code = nil)
      @code = code
      super msg
    end
  end
end
