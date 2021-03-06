#coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bibcli/version'

Gem::Specification.new do |spec|
  spec.name          = 'bibcli'
  spec.version       = Bibcli::VERSION
  spec.authors       = ["Abel Soares Siqueira"]
  spec.email         = ["abel.s.siqueira@gmail.com"]
  spec.summary       = "Bibcli"
  spec.description   = "Command line reference manager"
  spec.homepage      = 'http://github.com/abelsiqueira/bibcli'
  spec.license       = 'GPLv3'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2.6"

  spec.add_runtime_dependency 'bibtex-ruby', '~> 3.1'
  spec.add_runtime_dependency 'json', '~> 1.8'
  spec.add_runtime_dependency 'i18n', '~> 0.6'
end
