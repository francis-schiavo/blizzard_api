# frozen_string_literal: true

module BlizzardApi
  module Wow
    # Support for slugs
    module Slug
      def string_to_slug(string)
        CGI.escape(string.downcase.tr(' ', '-'))
      end
    end
  end
end
