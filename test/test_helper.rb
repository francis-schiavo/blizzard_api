# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'minitest/autorun'

require 'blizzard_api'
require 'dotenv'
Dotenv.load

BlizzardApi.configure do |config|
  config.app_id = ENV['BNET_APPLICATION_ID']
  config.app_secret = ENV['BNET_APPLICATION_SECRET']
  config.region = 'us'
  config.redis_url = ENV.fetch('REDIS_URL', nil)
  config.cache_access_token = ENV.fetch('CACHE_ACCESS_TOKEN', 'false').eql? 'true'
end
