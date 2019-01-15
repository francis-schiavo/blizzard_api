# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class QuestTest < Minitest::Test
      def test_quest_get
        quest = BlizzardApi::Wow::Quest.new
        quest_data = quest.get 13_146
        assert_equal 80, quest_data[:level]
      end
    end
  end
end
