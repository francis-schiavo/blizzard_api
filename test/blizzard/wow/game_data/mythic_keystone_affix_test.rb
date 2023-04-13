# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class MythicKeystoneAffixTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.mythic_keystone_affix
      end

      def test_mythic_keystone_affix_index
        data = @endpoint.index
        assert_equal 'Overflowing', data.dig(:affixes, 0, :name, :en_US)
      end

      def test_mythic_keystone_affix_get
        data = @endpoint.get 1
        assert_equal 'Overflowing', data.dig(:name, :en_US)
      end

      def test_mythic_keystone_affix_media
        data = @endpoint.media 1
        assert_equal 'https://render.worldofwarcraft.com/us/icons/56/inv_misc_volatilewater.jpg', data.dig(:assets, 0, :value)
      end
    end
  end
end
