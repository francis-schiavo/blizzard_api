# frozen_string_literal: true

module BlizzardApi
  module Diablo
    ##
    # This class allows access to Diablo III act data
    #
    # @see https://develop.battle.net/documentation/api-reference/diablo-3-community-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Diablo.act
    class Act < BlizzardApi::Diablo::Request
      ##
      # Return a list with all acts
      #
      # @!macro request_options
      #
      # @!macro response
      def index(**options)
        api_request "#{base_url(:community)}/data/act", **{ ttl: CACHE_TRIMESTER }.merge(options)
      end

      ##
      # Return complete information about an act
      #
      # @param id [Integer] Act id
      # @!macro request_options
      #
      # @!macro response
      def get(id, **options)
        api_request "#{base_url(:community)}/data/act/#{id}", **{ ttl: CACHE_TRIMESTER }.merge(options)
      end
    end
  end
end
