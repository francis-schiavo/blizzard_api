# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class AzeriteEssenceTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.azerite_essence
      end

      def test_azerite_essence_index
        data = @endpoint.index
        assert_equal 28, data[:azerite_essences].count
      end

      def test_azerite_essence_get
        data = @endpoint.get 2
        assert_equal 'Azeroth\'s Undying Gift', data.dig(:name, :en_US)
      end

      def test_azerite_essence_media
        data = @endpoint.media 2
        assert data.key? :assets
      end

      def test_azerite_essence_search
        data = @endpoint.search(1, 100) do |search_options|
          search_options.where 'name.pt_BR', 'Ressonância da Veia do Mundo'
        end
        assert_equal 'Worldvein Resonance', data.dig(:results, 0, :data, :name, :en_US)
      end
    end
  end
end
