# frozen_string_literal: true

# frozen_string_litcharacterl: true

require 'test_helper'

module BlizzardApi
  module Diablo
    class CharacterTest < Minitest::Test
      def test_character_index
        character = BlizzardApi::Diablo::Character.new
        character_data = character.get 'barbarian'
        assert character_data[:skillCategories]
      end

      def test_character_get
        character = BlizzardApi::Diablo::Character.new
        character_data = character.skill 'barbarian', 'bash'
        assert character_data[:skill]
      end
    end
  end
end
