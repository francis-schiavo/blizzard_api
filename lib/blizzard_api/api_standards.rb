# frozen_string_literal: true

module BlizzardApi
  ##
  # Default constants and helper functions for the API format
  module ApiStandards
    # Common endpoints
    BASE_URLS = {
      game_data: 'https://%s.api.blizzard.com/data/%s',
      community: 'https://%s.api.blizzard.com/%s',
      profile: 'https://%s.api.blizzard.com/profile/%s',
      media: 'https://%s.api.blizzard.com/data/%s/media',
      user_profile: 'https://%s.api.blizzard.com/profile/user/%s',
      search: 'https://%s.api.blizzard.com/data/%s/search'
    }.freeze

    protected

    def base_url(scope)
      raise ArgumentError, 'Invalid scope' unless BASE_URLS.include? scope

      format BASE_URLS[scope], region, @game
    end

    ##
    # Returns a valid version namespace
    #
    # @param [Hash] options A hash containing a valid namespace key
    def endpoint_version(options)
      if options.key? :classic
        'classic-'
      elsif options.key? :classic1x
        'classic1x-'
      else
        ''
      end
    end

    ##
    # Returns a valid namespace string for consuming the api endpoints
    #
    # @param [Hash] options A hash containing the namespace key
    def endpoint_namespace(options)
      version = endpoint_version(options)

      return "dynamic-#{version}#{region}" if options[:namespace].eql? :dynamic

      return "static-#{version}#{region}" if options[:namespace].eql? :static

      return "profile-#{version}#{region}" if options[:namespace].eql? :profile

      raise ArgumentError, 'Invalid namespace scope'
    end
  end
end
