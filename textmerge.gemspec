# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'Textmerge/version'

Gem::Specification.new do |spec|
  spec.name          = "Textmerge"
  spec.version       = Textmerge::VERSION
  spec.authors       = ["Chris Simpson"]
  spec.email         = ["ctsimpson@gmail.com"]
  spec.description   = "Merge Text using customized templates"
  spec.summary       = "Good for configuration files and whatever"
  spec.homepage      = "http://www.ctsimpson.com"
  spec.license       = "MIT"

  spec.bindir = "bin"
  spec.files         = `git ls-files`.split($/)
  spec.executables   << 'Textmerge'
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.1"
  spec.add_development_dependency "guard-rspec", "~> 4.2"
  spec.add_dependency "thor"
  spec.add_dependency "highline", "~> 1.6"
end
