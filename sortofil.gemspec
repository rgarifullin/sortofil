$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'sortofil/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'sortofil'
  s.version     = Sortofil::VERSION
  s.authors     = ['Rinat Garifullin']
  s.email       = ['ringarifullin@gmail.com']
  s.homepage    = 'TODO'
  s.summary     = 'TODO: Summary of Sortofil.'
  s.description = 'TODO: Description of Sortofil.'
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*", 'MIT-LICENSE', 'Rakefile',
                'README.md']

  s.add_dependency 'rails', '~> 5.1.1'

  s.add_development_dependency 'sqlite3'
end
