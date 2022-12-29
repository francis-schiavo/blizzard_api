# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module OverwatchLeague
    class SegmentsTest < Minitest::Test
      def setup
        @segments = BlizzardApi::OverwatchLeague.segments
      end

      def test_segment
        summary = BlizzardApi::OverwatchLeague.summary.get
        segment_id = summary[:segments].first[1][:id]

        data = @segments.get segment_id
        assert data[:firstMatchStart]
      end
    end
  end
end
