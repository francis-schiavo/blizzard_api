# frozen_string_literal: true

# frozen_string_litcharacterl: true

require 'test_helper'

module BlizzardApi
  module Diablo
    class CharacterClassTest < Minitest::Test
      def setup
        @character = BlizzardApi::Diablo.character
      end

      def test_character_get
        character_data = @character.get 'barbarian'
        assert character_data[:skillCategories]
      end

      def test_character_skill
        character_data = @character.skill 'barbarian', 'bash'
        assert character_data[:skill]
      end
    end
  end
end
