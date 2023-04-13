# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class GuildCrestTest < Minitest::Test
      def setup
        @guild_crest = BlizzardApi::Wow.guild_crest
      end

      def test_guild_crest_index
        guild_crest_data = @guild_crest.index
        assert_equal 6, guild_crest_data[:borders].count
        assert_equal 196, guild_crest_data[:emblems].count

        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        guild_crest_data = @guild_crest.index classic: true
        assert_equal 6, guild_crest_data[:borders].count
      end

      def test_guild_crest_border
        guild_crest_data = @guild_crest.border_media 0
        assert_equal 'https://render.worldofwarcraft.com/us/guild/tabards/border_00.png',
                     guild_crest_data.dig(:assets, 0, :value)

        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        guild_crest_data = @guild_crest.border_media 0, classic: true
        assert_equal 'https://render.worldofwarcraft.com/classic-us/guild/tabards/border_00.png',
                     guild_crest_data.dig(:assets, 0, :value)
      end

      def test_guild_crest_emblem
        guild_crest_data = @guild_crest.emblem_media 0
        assert_equal 'https://render.worldofwarcraft.com/us/guild/tabards/emblem_00.png',
                     guild_crest_data.dig(:assets, 0, :value)

        return if ENV.fetch('IGNORE_CLASSIC_TESTS', false)

        guild_crest_data = @guild_crest.emblem_media 0, classic: true
        assert_equal 'https://render.worldofwarcraft.com/classic-us/guild/tabards/emblem_00.png',
                     guild_crest_data.dig(:assets, 0, :value)
      end
    end
  end
end
