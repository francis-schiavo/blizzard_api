# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class SpellTest < Minitest::Test
      def setup
        @spell = BlizzardApi::Wow.spell
      end

      def test_spell_get
        spell_data = @spell.get 196_607
        assert_equal 'Eye of the Tiger', spell_data[:name][:en_US]
      end

      def test_spell_media
        spell_data = @spell.display_media 196_607
        assert_equal 'https://render-us.worldofwarcraft.com/icons/56/ability_druid_primalprecision.jpg', spell_data[:assets][0][:value]
      end
    end
  end
end
