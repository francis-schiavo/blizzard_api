# frozen_string_literal: true

module BlizzardApi
  ##
  # Manages the current token and expiration date
  module TokenManager
    REDIS_TOKEN_KEY = 'access_token'

    ##
    # @!attribute access_token
    #   Current access token.
    #   @return [String] access_token
    attr_accessor :access_token

    ##
    # @!attribute expires_at
    #   Current access token expiration date.
    #   @return [String] expires_at
    attr_accessor :expires_at

    ##
    # Returns if the current token has expired
    #
    # @return [Boolean]
    def access_token_expired?
      return true if access_token.nil?

      expires_at < Time.now
    end

    def restore_access_token
      return false unless use_cache && cache_access_token

      return false unless redis_connection.exists? REDIS_TOKEN_KEY

      self.access_token = redis_connection.get REDIS_TOKEN_KEY
      self.expires_at = Time.now + redis_connection.ttl(REDIS_TOKEN_KEY)
      true
    end

    def save_access_token(token_data)
      ttl = token_data['expires_in'].to_i
      self.expires_at = Time.now + ttl
      self.access_token = token_data['access_token']

      redis_connection.setex REDIS_TOKEN_KEY, ttl, access_token if use_cache && cache_access_token
    end
  end
end
