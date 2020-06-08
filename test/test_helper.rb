# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'minitest/autorun'

require 'blizzard_api'
require 'dotenv'
Dotenv.load

BlizzardApi.configure do |config|
  puts ENV['BNET_APPLICATION_ID']
  config.app_id = ENV['BNET_APPLICATION_ID']
  config.app_secret = ENV['BNET_APPLICATION_SECRET']
  config.region = 'us'
  config.use_cache = ENV['USE_CACHE'] == 'true'
  config.redis_host = ENV['REDIS_HOST']
  config.redis_port = ENV['REDIS_PORT']
end
