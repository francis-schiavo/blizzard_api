# frozen_string_literal: true

require_relative 'blizzard_api/configuration'
require_relative 'blizzard_api/token_manager'
require_relative 'blizzard_api/api_standards'
require_relative 'blizzard_api/api_response'
require_relative 'blizzard_api/request'
require_relative 'blizzard_api/exception'
require_relative 'blizzard_api/version'
require_relative 'blizzard_api/wow'
require_relative 'blizzard_api/diablo'
require_relative 'blizzard_api/hearthstone'
require_relative 'blizzard_api/starcraft'

# Blizzard namespace
module BlizzardApi
  extend TokenManager
  extend Configuration

  def self.redis_connection
    return nil unless use_cache?

    @redis_connection ||= Redis.new(url: BlizzardApi.redis_url)
  end
end
