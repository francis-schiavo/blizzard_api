# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class AzeriteEssenceTest < Minitest::Test
      def setup
        @azerite_essence = BlizzardApi::Wow::AzeriteEssence.new
      end

      def test_azerite_essence_index
        title_data = @azerite_essence.index
        assert_equal 21, title_data[:azerite_essences].count
      end

      def test_azerite_essence_get
        title_data = @azerite_essence.get 2
        assert_equal 'Azeroth\'s Undying Gift', title_data[:name][:en_US]
      end

      def test_azerite_essence_media
        item_data = @azerite_essence.media 2
        assert item_data.key? :assets
      end
    end
  end
end
