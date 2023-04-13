# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class TechTalentTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.tech_talent
      end

      def test_tech_talent_index
        data = @endpoint.index
        assert data.key? :talents
      end

      def test_tech_talent_get
        data = @endpoint.get 863
        assert_equal 'Run Without Tiring', data.dig(:name, :en_US)
      end

      def test_tech_talent_media
        data = @endpoint.media 863
        assert_equal 'https://render.worldofwarcraft.com/us/icons/56/ability_racial_runningwild.jpg', data.dig(:assets, 0, :value)
      end

      def test_tech_talent_tree_index
        data = @endpoint.tech_talent_trees
        assert data.key? :talent_trees
      end

      def test_tech_talent_tree
        data = @endpoint.tech_talent_tree 275
        assert_equal 12, data[:max_tiers]
      end
    end
  end
end
