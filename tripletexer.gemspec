$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'tripletexer/version'

Gem::Specification.new do |s|
  s.name        = 'tripletexer'
  s.version     = Tripletexer::VERSION
  s.authors     = ['Aldis Berjoza']
  s.email       = ['aldis@berjoza.lv']
  s.homepage    = 'https://github.com/graudeejs/tripletexer'
  s.summary     = 'tripletex.no APIv2 client'
  s.license     = 'BSD-2-Clause'

  s.files = Dir['README.md', 'LICENSE', 'lib/**/*']
  s.test_files = Dir['spec/**/*']

  s.required_ruby_version = '>= 2.2.2'

  s.add_dependency 'faraday', '>= 0.10.0'
  s.add_dependency 'faraday_middleware', '>= 0.10.1'
  s.add_dependency 'json', '>= 1.8.5'

  s.add_development_dependency 'reek', '~> 4'
  s.add_development_dependency 'rubocop', '~> 0.50'
  s.add_development_dependency 'pry', '~> 0.10'
  s.add_development_dependency 'pry-nav', '~> 0.2'
  s.add_development_dependency 'yard', '~> 0.9'
  s.add_development_dependency 'rubycritic', '~> 3.2'
  s.add_development_dependency 'rspec', '~> 3.6'
  s.add_development_dependency 'simplecov', '~> 0.15.1'
  s.add_development_dependency 'dotenv', '~> 2.2', '>= 2.2.1'
  s.add_development_dependency 'vcr', '~> 3.0', '>= 3.0.3'
  s.add_development_dependency 'webmock', '~> 3.0', '>= 3.0.1'
end
