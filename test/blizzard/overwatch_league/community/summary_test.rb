# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module OverwatchLeague
    class SummaryTest < Minitest::Test
      def setup
        @summary = BlizzardApi::OverwatchLeague.summary
      end

      def test_summary
        data = @summary.get
        assert data[:players]
      end
    end
  end
end
