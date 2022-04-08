# frozen_string_literal: true

# frozen_string_litartisanl: true

require 'test_helper'

module BlizzardApi
  module Diablo
    class ArtisanTest < Minitest::Test
      def setup
        @artisan = BlizzardApi::Diablo.artisan
      end

      def test_artisan_get
        artisan_data = @artisan.get 'blacksmith'
        assert artisan_data[:training]
      end

      def test_artisan_recipe
        artisan_data = @artisan.recipe 'blacksmith', 'apprentice-flamberge'
        assert artisan_data[:reagents]
      end
    end
  end
end
