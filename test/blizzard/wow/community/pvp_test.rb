# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PvPTest < Minitest::Test
      def test_pvp_index
        pvp = BlizzardApi::Wow::PvP.new
        pvp_data = pvp.get '2v2'
        assert pvp_data[:rows]
      end
    end
  end
end
