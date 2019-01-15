# frozen_string_literal: true

##
# @!macro [new] sc2_regions
#   @param {Symbol} region_id One of the valid Starcraft II regions *:US*, *:EU*, *:KO*, and *:TW*
#   @note This gem do not support nor will support China endpoints

module BlizzardApi
  module Starcraft
    ##
    # Starcraft requests
    class Request < BlizzardApi::Request
      # Possible regions for the SC II API (Except China)
      SC_REGION = { US: 1, EU: 2, KO: 3, TW: 3 }.freeze

      ##
      # @!macro regions
      def initialize(region = nil)
        super region
        @game = 'sc2'
      end

      private

      ##
      # Helper method to find a region_id by its symbol
      def resolve_region(region_arg)
        return region_arg if region_arg.is_a? Integer

        return SC_REGION[region_arg] if region_arg.is_a? Symbol

        raise ArgumentError, 'Invalid region, please read the documentation'
      end
    end
  end
end
