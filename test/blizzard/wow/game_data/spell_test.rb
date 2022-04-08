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
        assert_equal 'https://render.worldofwarcraft.com/us/icons/56/ability_druid_primalprecision.jpg', spell_data[:assets][0][:value]
      end

      def test_spell_search
        data = @spell.search(1, 100) do |search_options|
          search_options.where 'name.en_US', 'Tranquility'
          search_options.order_by 'id'
        end
        assert_equal 'Tranquilidade', data[:results][0][:data][:name][:pt_BR]
      end
    end
  end
end
