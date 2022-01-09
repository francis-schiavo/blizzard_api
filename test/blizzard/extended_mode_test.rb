# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  class ExtendedModeTest < Minitest::Test
    def setup
      @achievement = BlizzardApi::Wow.achievement mode: :extended
    end

    def test_achievement_index
      response, achievement_data = @achievement.index
      assert_equal 200, response.code.to_i
      assert achievement_data.key? :achievements
    end
  end
end
