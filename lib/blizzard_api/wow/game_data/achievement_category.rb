# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft achievement categories
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.achievement_categories
    class AchievementCategory < Wow::GenericDataEndpoint
      def complete(options = {})
        [].tap do |complete_data|
          index_data = index options
          %i[categories root_categories guild_categories].each do |group_key|
            index_data[group_key].each do |item|
              link = item.key?(:key) ? item[:key][:href] : item[:href]
              item_data = request link
              complete_data.push item_data
            end
          end
        end
      end

      protected

      def endpoint_setup
        @endpoint = 'achievement-category'
        @namespace = endpoint_namespace :static
        @collection = 'categories'
        @ttl = CACHE_TRIMESTER
      end
    end
  end
end
