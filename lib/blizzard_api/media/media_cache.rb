module BlizzardApi
  module Media
    # Used to store and retrieve API media files
    class MediaCache
      def download_media(filename, url)
        require 'net/http'
        require 'fileutils'

        FileUtils.mkdir_p File.dirname(filename)

        File.open(filename, 'wb') do |file|
          data = Net::HTTP.get_response(URI.parse(url)).body
          file << data
        end
      end
    end
  end
end
