# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class CharacterTest < Minitest::Test
      def test_guild_rewards
        guild = BlizzardApi::Wow::Guild.new
        guild_data = guild.rewards
        assert guild_data[:rewards]
      end

      def test_guild_perks
        guild = BlizzardApi::Wow::Guild.new
        guild_data = guild.perks
        assert guild_data[:perks]
      end
    end
  end
end
