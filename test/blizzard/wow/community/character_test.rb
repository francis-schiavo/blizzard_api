# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class CharacterTest < Minitest::Test
      def test_character_get
        character = BlizzardApi::Wow::Character.new
        character_data = character.get 'azralon', 'Schiller', ['titles']
        assert_equal 11, character_data[:class]
      end
    end
  end
end
