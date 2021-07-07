# frozen_string_literal: true

module BlizzardApi
  module Starcraft
    ##
    # This class allows access to Starcraft II league data
    #
    # @see https://develop.battle.net/documentation/api-reference/starcraft-2-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Starcraft.account
    class Account < Starcraft::Request
      ##
      # Returns information about a player account
      #
      # @param [Integer] account_id Account ID
      # @!macro request_options
      def player(account_id, **options)
        api_request "#{base_url(:community)}/player/#{account_id}", **{ ttl: CACHE_DAY }.merge(options)
      end
    end
  end
end
