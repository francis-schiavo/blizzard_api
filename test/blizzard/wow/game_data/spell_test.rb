# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class SpellTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.spell
      end

      def test_spell_get
        data = @endpoint.get 196_607
        assert_equal 'Eye of the Tiger', data.dig(:name, :en_US)
      end

      def test_spell_media
        data = @endpoint.display_media 196_607
        assert_equal 'https://render.worldofwarcraft.com/us/icons/56/ability_druid_primalprecision.jpg', data.dig(:assets, 0, :value)
      end

      def test_spell_search
        data = @endpoint.search(1, 100) do |search_options|
          search_options.where 'name.en_US', 'Tranquility'
          search_options.order_by 'id'
        end
        assert_equal 'Tranquilidade', data.dig(:results, 0, :data, :name, :pt_BR)
      end
    end
  end
end
