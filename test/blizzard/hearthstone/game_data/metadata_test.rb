# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Hearthstone
    class MetadataTest < Minitest::Test
      def test_metadata_index
        metadata = BlizzardApi::Hearthstone::Metadata.new
        metadata_data = metadata.index
        assert metadata_data[:sets]
      end

      def test_metadata_get
        metadata = BlizzardApi::Hearthstone::Metadata.new
        metadata_data = metadata.get 'sets'
        assert metadata_data.is_a? Array
        assert metadata_data[0][:slug]
      end
    end
  end
end
