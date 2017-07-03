$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'sortofil/version'

Gem::Specification.new do |s|
  s.name        = 'sortofil'
  s.version     = Sortofil::VERSION
  s.authors     = ['Rinat Garifullin']
  s.email       = ['ringarifullin@gmail.com']
  s.homepage    = 'https://github.com/rgarifullin/sortofil'
  s.summary     = 'Sorting and filtering tool'
  s.description = 'Set of sort and filter helpers'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile',
                'README.md']

  s.add_dependency 'rails', '~> 5.1'
  s.add_dependency 'font-awesome-rails', '~> 4.7'

  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'puma'
  s.add_development_dependency 'sqlite3'
end
