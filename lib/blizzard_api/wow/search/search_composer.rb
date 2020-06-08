# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # Composer for search endpoint arguments
    class SearchComposer
      attr_accessor :fields, :order, :page, :page_size

      def initialize(page, page_size)
        self.page = page
        self.page_size = page_size
        self.fields = []
        self.order = []
      end

      ##
      # Add a search field
      #
      # The second argument takes a simple value, an array of values or a hash for range searches.
      #
      # @param field [String] Field name
      # @param value [String|Integer|Hash|Array<Integer|String>]
      # @option value [Integer] :min Range start
      # @option value [Integer] :max Range end
      # @option value [Integer] :mode Range mode (:inclusive|:exclusive)
      #
      # @return {SearchComposer}
      def where(field, value)
        fields.push "#{field}=#{resolve_value(value)}"
        self
      end

      ##
      # Add a search field
      #
      # The second argument takes a simple value, an array of values or a hash for range searches.
      #
      # @param field [String] Field name
      # @param value [String|Integer|Hash|Array<Integer|String>]
      # @option value [Integer] :min Range start
      # @option value [Integer] :max Range end
      # @option value [Integer] :mode Range mode (:inclusive|:exclusive)
      #
      # @return {SearchComposer}
      def where_not(field, value)
        fields.push "#{field}!=#{resolve_value(value)}"
        self
      end

      ##
      # Add a sort field
      #
      # @param field [String] Field name
      # @param mode [Symbol] :asc or :desc
      #
      # @return {SearchComposer}
      def order_by(field, mode = :asc)
        raise ArgumentError, 'Invalid order mode.' unless %i[asc desc].include? mode

        order.push "#{field}:#{mode}"
        self
      end

      ##
      # Returns a valid queryString based on the options
      #
      # @return {String}
      def to_search_query
        query_string = "_page=#{page}&_pageSize=#{page_size}"
        query_string += '&' + fields.join('&') unless fields.size.zero?
        query_string += "&orderby=#{order.join(',')}" unless order.size.zero?
        query_string
      end

      protected

      def resolve_value(value)
        return value.join '||' if value.is_a? Array

        return value.to_s unless value.is_a? Hash

        resolve_hash value
      end

      def resolve_hash(value)
        min = value.key?(:min) ? value[:min] : ''
        max = value.key?(:max) ? value[:max] : ''
        mode = value.key?(:mode) ? value[:mode] : :inclusive

        return "[#{min},#{max}]" if mode.eql? :inclusive

        "(#{min},#{max})"
      end
    end
  end
end
