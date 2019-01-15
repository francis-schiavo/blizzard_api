# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class MythicKeystoneAffixTest < Minitest::Test
      def test_mythic_keystone_affix_index
        affix = BlizzardApi::Wow::MythicKeystoneAffix.new
        affix_data = affix.index
        assert_equal 'Overflowing', affix_data[:affixes][0][:name][:en_US]
      end

      def test_mythic_keystone_affix_get
        affix = BlizzardApi::Wow::MythicKeystoneAffix.new
        affix_data = affix.get 1
        assert_equal 'Overflowing', affix_data[:name][:en_US]
      end

      def test_mythic_keystone_affix_complete
        affix = BlizzardApi::Wow::MythicKeystoneAffix.new
        affix_data = affix.complete
        assert_equal 'Overflowing', affix_data[0][:name][:en_US]
      end
    end
  end
end
