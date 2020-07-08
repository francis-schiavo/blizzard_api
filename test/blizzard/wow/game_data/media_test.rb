# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class MediaTest < Minitest::Test
      def setup
        @media = BlizzardApi::Wow.media
      end

      def test_media_search
        data = @media.search(1, 100) do |search_options|
          search_options.where 'tags', 'item'
          search_options.order_by 'id'
        end
        assert_equal 'https://render-us.worldofwarcraft.com/icons/56/inv_sword_04.jpg', data[:results][0][:data][:assets][0][:value]
      end
    end
  end
end
