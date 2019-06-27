module BlizzardApi
  module Wow
    # Wow endpoints media downloader
    class Media < BlizzardApi::Media::MediaCache
      def download_media(url, media_type)
        image_name = url.match(/[a-z_0-9]+.jpg$/)[0]
        path = media_base_path media_type
        download_media url, path + image_name
      end

      private

      def media_base_path(media_type)
        case media_type
        when :icon
          BlizzardApi::Media.wow_icons_directory
        when :profile
          BlizzardApi::Media.wow_character_profile_directory
        when :guild
          BlizzardApi::Media.wow_guild_crest_directory
        else
          raise ArgumentError
        end
      end
    end
  end
end