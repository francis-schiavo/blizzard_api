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
        talent_data = @talent.get 23_106
        assert_equal 15, talent_data[:level]
      end

      def test_pvp_talent_index
        talent_data = @talent.pvp_talents
        assert_equal 412, talent_data[:pvp_talents].count
      end

      def test_pvp_talent_get
        talent_data = @talent.pvp_talent 11
        assert_equal 'Bane of Fragility', talent_data[:spell][:name][:en_US]
      end
    end
  end
end
