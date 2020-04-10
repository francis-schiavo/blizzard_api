# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class TitleTest < Minitest::Test
      def setup
        @title = BlizzardApi::Wow.title
      end

      def test_title_index
        title_data = @title.index
        assert_equal 375, title_data[:titles].count
      end

      def test_title_get
        title_data = @title.get 10
        assert_equal 'Lieutenant Commander', title_data[:name][:en_US]
      end
    end
  end
end
