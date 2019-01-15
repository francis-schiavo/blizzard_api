# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class RecipeTest < Minitest::Test
      def test_recipe_get
        recipe = BlizzardApi::Wow::Recipe.new
        recipe_data = recipe.get 33_994
        assert_equal 'spell_holy_greaterheal', recipe_data[:icon]
      end
    end
  end
end
