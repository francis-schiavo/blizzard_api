# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class GuildTest < Minitest::Test
      def setup
        @guild_crest = BlizzardApi::Wow::Guild.new
      end

      def test_guild_rewards
        guild_data = @guild_crest.rewards
        assert guild_data[:rewards]
      end

      def test_guild_perks
        guild_data = @guild_crest.perks
        assert guild_data[:perks]
      end

      def test_guild_get
        guild_data = @guild_crest.get 'Azralon', 'Mitocracia'
        assert 'Mitocracia', guild_data[:name]
      end

      def test_guild_roster
        guild_data = @guild_crest.roster 'Azralon', 'Mitocracia'
        assert 'Mitocracia', guild_data.include?(:members)
      end

      def test_guild_achievements
        guild_data = @guild_crest.achievements 'Azralon', 'Mitocracia'
        assert 'Mitocracia', guild_data.include?(:achievements)
      end
    end
  end
end
