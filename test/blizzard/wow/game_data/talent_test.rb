# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class TalentTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.talent
      end

      def test_talent_index
        data = @endpoint.index
        assert data.key? :talents
      end

      def test_talent_get
        data = @endpoint.get 117_163
        assert_equal 'Best Served Cold', data.dig(:spell, :name, :en_US)
      end

      def test_talent_tree_index
        data = @endpoint.talent_trees
        assert data.key? :spec_talent_trees
        assert data.key? :class_talent_trees
      end

      def test_talent_tree_get
        data = @endpoint.talent_tree 786, 262
        assert_equal 'Elemental', data.dig(:playable_specialization, :name, :en_US)
      end

      def test_talent_tree_nodes
        data = @endpoint.talent_tree_nodes 786
        assert_equal 'Restoration', data.dig(:spec_talent_trees, 0, :name, :en_US)
      end

      def test_pvp_talent_index
        data = @endpoint.pvp_talents
        assert data.key? :pvp_talents
      end

      def test_pvp_talent_get
        data = @endpoint.pvp_talent 100
        assert_equal 'Purification', data.dig(:spell, :name, :en_US)
      end
    end
  end
end
