module BlizzardApi
  module Media
    # Media configuration and helpers
    module MediaConfiguration
      ##
      # @!attribute icons_directory
      #   Icons directory.
      #   This directory stores icons for many World of Warcraft endpoints.
      #   @return [String] icons_directory
      attr_accessor :wow_icons_directory

      ##
      # @!attribute guild_emblem_directory
      #   Guild crest images directory. Some sub directories will be crated.
      #   @see https://develop.battle.net/access/clients
      #   @return [String] Guild crest directory
      attr_accessor :wow_guild_crest_directory

      ##
      # @!attribute wow_character_profile_directory
      #   This directory stores images for World of Warcraft character profiles. Sub directories will be created for each
      #   realm and character.
      #   @return [String] Character profile media directory
      attr_accessor :wow_character_profile_directory

      ##
      # This method return the singleton instance of the media module. Use this to initialize the default values
      # and options.
      #
      # @yield self
      #
      # @example
      #   Blizzard::Media.configure do |config|
      #     config.icons_directory = './wow/icons'
      #     config.guild_crest_directory = './wow/guild_crest'
      #     config.wow_character_profile_directory = './wow/profile'
      #   end
      def configure
        yield self
      end
    end
  end
end
