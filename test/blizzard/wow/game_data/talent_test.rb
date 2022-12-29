# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class TalentTest < Minitest::Test
      def setup
        @talent = BlizzardApi::Wow.talent
      end

      def test_talent_index
        talent_data = @talent.index
        assert talent_data.key? :talents
      end

      def test_talent_get
        talent_data = @talent.get 117163
        assert_equal 'Best Served Cold', talent_data[:spell][:name][:en_US]
      end

      def test_talent_tree_index
        talent_data = @talent.talent_trees
        assert talent_data.key? :spec_talent_trees
        assert talent_data.key? :class_talent_trees
      end

      def test_talent_tree_get
        talent_data = @talent.talent_tree 786, 262
        assert_equal 'Elemental', talent_data[:playable_specialization][:name][:en_US]
      end

      def test_pvp_talent_index
        talent_data = @talent.pvp_talents
        assert talent_data.key? :pvp_talents
      end

      def test_pvp_talent_get
        talent_data = @talent.pvp_talent 11
        assert_equal 'Bane of Fragility', talent_data[:spell][:name][:en_US]
      end
    end
  end
end
