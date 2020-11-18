# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class TechTalentTest < Minitest::Test
      def setup
        @talent = BlizzardApi::Wow.tech_talent
      end

      def test_tech_talent_index
        talent_data = @talent.index
        assert talent_data.key? :talents
      end

      def test_tech_talent_get
        talent_data = @talent.get 807
        assert_equal 'Skillful Duelist', talent_data[:name][:en_US]
      end

      def test_tech_talent_media
        talent_data = @talent.media 807
        assert_equal 'https://render-us.worldofwarcraft.com/icons/56/inv_tabard_duelersguild.jpg', talent_data[:assets][0][:value]
      end

      def test_tech_talent_tree_index
        talent_data = @talent.tech_talent_trees
        assert talent_data.key? :talent_trees
      end

      def test_tech_talent_tree
        talent_data = @talent.tech_talent_tree 272
        assert_equal 5, talent_data[:max_tiers]
      end
    end
  end
end
