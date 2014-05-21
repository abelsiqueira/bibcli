Gem::Specification.new do |s|
  s.name = 'bibcli'
  s.version = '0.0.0'
  s.executables << 'bibcli'
  s.date = '2014-04-23'
  s.summary = "Bibcli"
  s.description = "Command line reference manager"
  s.authors = ["Abel Soares Siqueira"]
  s.email = "abel.s.siqueira@gmail.com"
  s.add_dependency 'bibtex-ruby', '~> 3.1'
  s.add_dependency 'json', '~> 1.8'

  s.files = `git ls-files lib`.split($/)
  s.homepage = 'http://github.com/abelsiqueira/bibcli'
  s.license = 'GPLv3'
end
