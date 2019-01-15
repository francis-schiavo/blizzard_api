# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class SpellTest < Minitest::Test
      def test_spell_get
        spell = BlizzardApi::Wow::Spell.new
        spell_data = spell.get 17_086
        assert_equal 'spell_fire_fire', spell_data[:icon]
      end
    end
  end
end
