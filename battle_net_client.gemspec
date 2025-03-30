# frozen_string_literal: true

require_relative 'lib/battle_net_client'

Gem::Specification.new do |spec|
  spec.name = 'battle_net_client'
  spec.version = BattleNetClient::VERSION
  spec.summary = 'Battle.Net API Client'
  spec.description = 'A Ruby client for the Battle.net API'
  spec.authors = ['Arne "Noel Frostpaw" De Herdt']
  spec.email = 'arne.de.herdt@gmail.com'
  spec.homepage = 'https://github.com/coding-red-panda/battle_net_client'
  spec.license = 'MIT'

  # Ruby Configuration
  spec.required_ruby_version = '>= 3.1.0'

  # Metadata Configuration
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/coding-red-panda/battle_net_client'
  spec.metadata['changelog_uri'] = 'https://github.com/coding-red-panda/battle_net_client/blob/main/CHANGELOG.md'
  spec.metadata['rubygems_mfa_required'] = 'true'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Runtime dependencies
  spec.add_dependency 'activesupport'
  spec.add_dependency 'faraday'
  spec.add_dependency 'oj'
end
