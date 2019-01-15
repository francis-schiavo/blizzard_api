# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class BossTest < Minitest::Test
      def test_boss_index
        boss = BlizzardApi::Wow::Boss.new
        boss_data = boss.index
        assert_equal 46_962, boss_data[:bosses][0][:id]
      end

      def test_boss_get
        boss = BlizzardApi::Wow::Boss.new
        boss_data = boss.get 24_723
        assert_equal 'selin-fireheart', boss_data[:urlSlug]
      end
    end
  end
end
