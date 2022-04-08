# frozen_string_literal: true

module BlizzardApi
  ##
  # Simple replacement for the http response object for cached data
  class ApiResponse
    attr_reader :code, :body

    def initialize(body)
      @code = 200
      @body = body
    end

    def cached?
      true
    end
  end
end

module Net
  # Workaround for fake response payloads
  class HTTPResponse
    def cached?
      false
    end
  end
end
