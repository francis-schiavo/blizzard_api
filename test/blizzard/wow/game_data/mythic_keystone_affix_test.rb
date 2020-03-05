# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class MythicKeystoneAffixTest < Minitest::Test
      def setup
        @affix = BlizzardApi::Wow::MythicKeystoneAffix.new
      end

      def test_mythic_keystone_affix_index
        affix_data = @affix.index
        assert_equal 'Overflowing', affix_data[:affixes][0][:name][:en_US]
      end

      def test_mythic_keystone_affix_get
        affix_data = @affix.get 1
        assert_equal 'Overflowing', affix_data[:name][:en_US]
      end

      def test_mythic_keystone_affix_complete
        affix_data = @affix.complete
        assert_equal 'Overflowing', affix_data[0][:name][:en_US]
      end

      def test_mythic_keystone_affix_media
        affix_data = @affix.media 1
        assert_equal 'https://render-us.worldofwarcraft.com/icons/56/inv_misc_volatilewater.jpg', affix_data[:assets][0][:value]
      end
    end
  end
end
