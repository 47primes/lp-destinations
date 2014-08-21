require './lib/lp/destinations/version'

Gem::Specification.new do |s|
  s.name    = 'lp-destinations'
  s.version = LP::Destinations::VERSION
  s.authors = ['Mike Bradford']
  s.email   = 'mbradford@47primes.com'
  s.date    = Time.now.utc.strftime("%Y-%m-%d")

  s.homepage    = 'http://github.com/47primes/lp-destinations'
  s.summary     = "lp-destinations-#{LP::Destinations::VERSION}"
  s.description = 'Lonely Planet Coding Exercise'
  s.license     = 'MIT'

  s.platform      = Gem::Platform::RUBY
  s.require_path  = 'lib'
  s.files         = Dir["#{File.dirname(__FILE__)}/**/*"] + %w(README.md Rakefile lp-destinations.gemspec)
  s.test_files    = Dir.glob("spec/*.rb")
  s.rdoc_options  = ['--line-numbers', '--inline-source', '--title', 'lp-destinations', '--main', 'README.md']
  s.executables   = ['lp-build-destinations']

  s.add_dependency 'nokogiri', '~> 1.4'

  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 2.11'
end