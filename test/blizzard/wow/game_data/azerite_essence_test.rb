# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class AzeriteEssenceTest < Minitest::Test
      def setup
        @azerite_essence = BlizzardApi::Wow.azerite_essence
      end

      def test_azerite_essence_index
        data = @azerite_essence.index
        assert_equal 28, data[:azerite_essences].count
      end

      def test_azerite_essence_get
        data = @azerite_essence.get 2
        assert_equal 'Azeroth\'s Undying Gift', data[:name][:en_US]
      end

      def test_azerite_essence_media
        data = @azerite_essence.media 2
        assert data.key? :assets
      end

      def test_azerite_essence_search
        data = @azerite_essence.search(1, 100) do |search_options|
          search_options.where 'name.en_US', 'Worldvein Resonance'
        end
        assert_equal 'Ressonância da Veia do Mundo', data[:results][0][:data][:name][:pt_BR]
      end
    end
  end
end
