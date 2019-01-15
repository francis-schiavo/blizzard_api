# frozen_string_literal: true

# frozen_string_litactl: true

require 'test_helper'

module BlizzardApi
  module Diablo
    class ActTest < Minitest::Test
      def test_act_index
        act = BlizzardApi::Diablo::Act.new
        act_data = act.index
        assert act_data[:acts]
      end

      def test_act_get
        act = BlizzardApi::Diablo::Act.new
        act_data = act.get 1
        assert act_data[:quests]
      end
    end
  end
end
