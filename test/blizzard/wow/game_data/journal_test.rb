# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class JournalTest < Minitest::Test
      def setup
        @endpoint = BlizzardApi::Wow.journal
      end

      def test_journal_expansions
        data = @endpoint.expansions
        assert data.key? :tiers
      end

      def test_journal_expansion
        data = @endpoint.expansion 72
        assert_equal 'Wrath of the Lich King', data.dig(:name, :en_US)
      end

      def test_journal_instances
        data = @endpoint.instances
        assert data.key? :instances
      end

      def test_journal_instance
        data = @endpoint.instance(226)
        assert_equal 'Ragefire Chasm', data.dig(:name, :en_US)
      end

      def test_journal_encounters
        data = @endpoint.encounters
        assert data.key? :encounters
      end

      def test_journal_encounter
        data = @endpoint.encounter(89)
        assert_equal 'Glubtok', data.dig(:name, :en_US)
      end

      def test_journal_encounter_search
        data = @endpoint.encounter_search(1, 100) do |search_options|
          search_options.where 'name.en_US', 'Lich King'
        end
        assert_equal 'O Lich Rei', data.dig(:results, 0, :data, :name, :pt_BR)
      end
    end
  end
end
