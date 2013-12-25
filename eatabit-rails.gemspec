require './lib/eatabit-rails/version'

Gem::Specification.new do |s|
  s.name = 'eatabit-rails'
  s.version = Eatabit::VERSION
  s.author = 'Greg Oleksiak'
  s.email = 'greg@eatabit.com'

  s.description = 'The official gem for the eatabit.io API'
  s.summary = 'Abstracted from the eatabit-rails gem by Andrew Benton'
  s.homepage = 'https://github.com/eatabit/eatabit-rails'
  s.license = 'MIT'

  s.platform = Gem::Platform::RUBY
  s.require_paths = %w[lib]
  s.files = `git ls-files`.split("\n")
  s.test_files = Dir['spec/**/*.rb']

  s.add_dependency('multi_json', '>= 1.3.0')
  s.add_dependency('builder', '>= 2.1.2')
  s.add_dependency('jwt', '>= 0.1.2')

  s.add_development_dependency 'rake',    '~> 0.9.0'
  s.add_development_dependency 'rspec',   '~> 2.14.1'
  s.add_development_dependency 'fakeweb', '~> 1.3.0'
  s.add_development_dependency 'rack',    '~> 1.3.0'
end
