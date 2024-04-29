# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blizzard_api/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = '>= 3.0'
  spec.name = 'blizzard_api'
  spec.version = BlizzardApi::VERSION
  spec.authors = ['Francis Schiavo']
  spec.email = ['francis@schiavo.dev']
  spec.summary = 'Unofficial Ruby client for Blizzard Entertainment API'
  spec.description = 'This is a simple interface to obtain data from Blizzard API'
  spec.homepage = 'https://github.com/francis-schiavo/blizzard_api'
  spec.license = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.' unless spec.respond_to?(:metadata)

  spec.metadata['source_code_uri'] = 'https://github.com/francis-schiavo/blizzard_api'
  spec.metadata['bug_tracker_uri'] = 'https://github.com/francis-schiavo/blizzard_api/issues'
  spec.metadata['changelog_uri'] = 'https://github.com/francis-schiavo/blizzard_api/blob/master/CHANGELOG.md'
  spec.metadata['documentation_uri'] = 'https://rubydoc.info/gems/blizzard_api'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(/^(test|\..+|Rakefile)/) }
  end
  spec.executables = 'blizzard_api'
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'redis', '~> 4.1', '>= 4.1.0'

  spec.add_development_dependency 'dotenv', '~> 3.1'
  spec.add_development_dependency 'minitest', '~> 5.22'
  spec.add_development_dependency 'rake', '~> 13.2'
  spec.add_development_dependency 'rubocop', '~> 0.93.1'
  spec.add_development_dependency 'rubocop-minitest', '~> 0.27.0'
  spec.add_development_dependency 'yard', '~> 0.9.36'
end
