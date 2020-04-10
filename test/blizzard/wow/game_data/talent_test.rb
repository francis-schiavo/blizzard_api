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
        assert_equal 648, talent_data[:talents].count
      end

      def test_talent_get
        talent_data = @talent.get 23_106
        assert_equal 15, talent_data[:level]
      end

      def test_pvp_talent_index
        talent_data = @talent.pvp_talents
        assert_equal 508, talent_data[:pvp_talents].count
      end

      def test_pvp_talent_get
        talent_data = @talent.pvp_talent 3
        assert_equal 'Gladiator\'s Medallion', talent_data[:spell][:name][:en_US]
      end
    end
  end
end
