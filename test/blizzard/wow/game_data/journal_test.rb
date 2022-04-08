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
        assert journal_data.key? :tiers
      end

      def test_journal_expansion
        journal_data = @journal.expansion 72
        assert_equal 'Wrath of the Lich King', journal_data[:name][:en_US]
      end

      def test_journal_instances
        journal_data = @journal.instances
        assert journal_data.key? :instances
      end

      def test_journal_instance
        journal_data = @journal.instance(226)
        assert_equal 'Ragefire Chasm', journal_data[:name][:en_US]
      end

      def test_journal_encounters
        journal_data = @journal.encounters
        assert journal_data.key? :encounters
      end

      def test_journal_encounter
        journal_data = @journal.encounter(89)
        assert_equal 'Glubtok', journal_data[:name][:en_US]
      end

      def test_journal_encounter_search
        journal_data = @journal.encounter_search(1, 100) do |search_options|
          search_options.where 'name.en_US', 'Lich King'
        end
        assert_equal 'O Lich Rei', journal_data[:results][0][:data][:name][:pt_BR]
      end
    end
  end
end
