# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class MediaTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.media
      end

      def test_media_search
        data = @endpoint.search(1, 100) do |search_options|
          search_options.where 'tags', 'item'
          search_options.order_by 'id'
        end
        assert_equal 'https://render.worldofwarcraft.com/us/icons/56/inv_sword_04.jpg', data.dig(:results, 0, :data, :assets, 0, :value)
      end
    end
  end
end
