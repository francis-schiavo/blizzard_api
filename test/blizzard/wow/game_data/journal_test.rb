# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class JournalTest < Minitest::Test
      def setup
        @journal = BlizzardApi::Wow.journal
      end

      def test_journal_expansions
        journal_data = @journal.expansions
        assert_equal 8, journal_data[:tiers].count
      end

      def test_journal_expansion
        journal_data = @journal.expansion 72
        assert_equal 'Wrath of the Lich King', journal_data[:name][:en_US]
      end
    end
  end
end
