# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class GuildCrestTest < Minitest::Test
      def setup
        @guild_crest = BlizzardApi::Wow::GuildCrest.new
      end

      def test_guild_crest_index
        guild_crest_data = @guild_crest.index
        assert_equal 6, guild_crest_data[:borders].count
        assert_equal 196, guild_crest_data[:emblems].count

        guild_crest_data = @guild_crest.index classic: true
        assert_equal 6, guild_crest_data[:borders].count
      end

      def test_guild_crest_border
        guild_crest_data = @guild_crest.border_media 0
        assert_equal 'https://us.battle.net/wow/static/images/guild/tabards/border_00.png',
                     guild_crest_data[:assets][0][:value]

        guild_crest_data = @guild_crest.border_media 0, classic: true
        assert_equal 'https://render-classic-us.worldofwarcraft.com/guild/tabards/border_00.png',
                     guild_crest_data[:assets][0][:value]
      end

      def test_guild_crest_emblem
        guild_crest_data = @guild_crest.emblem_media 0
        assert_equal 'https://us.battle.net/wow/static/images/guild/tabards/emblem_00.png',
                     guild_crest_data[:assets][0][:value]

        guild_crest_data = @guild_crest.emblem_media 0, classic: true
        assert_equal 'https://render-classic-us.worldofwarcraft.com/guild/tabards/emblem_00.png',
                     guild_crest_data[:assets][0][:value]
      end
    end
  end
end
