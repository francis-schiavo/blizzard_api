# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft playable races
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   race = BlizzardApi::Wow.race
    class Race < Wow::GenericDataEndpoint
      ##
      # Returns a index of playable races
      #
      # @!macro request_options
      # @option options [Boolean] :use_community_endpoint If set to true, this method will call the community endpoint
      #   instead of the data endpoint https://develop.battle.net/documentation/api-reference/world-of-warcraft-community-api
      #
      # @!macro response
      def index(options = {})
        return super options unless options.include? :use_community_endpoint

        api_request "#{base_url(:community)}/data/character/races", { ttl: CACHE_TRIMESTER }.merge(options)
      end

      ##
      # @!macro complete
      def complete(options = {})
        index_data = index options
        [].tap do |races|
          index_data[:races].each do |race|
            race_id = %r{race/([0-9]+)}.match(race[:key].to_s)[1]
            race_data = get race_id, options
            race_data.delete :name
            races.push race_data
          end
        end
      end

      protected

      def endpoint_setup
        @endpoint = 'race'
        @namespace = endpoint_namespace :static
        @collection = 'races'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
