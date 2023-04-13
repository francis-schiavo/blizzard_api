# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class TitleTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.title
      end

      def test_title_index
        data = @endpoint.index
        assert data.key? :titles
      end

      def test_title_get
        data = @endpoint.get 10
        assert_equal 'Lieutenant Commander', data.dig(:name, :en_US)
      end
    end
  end
end
