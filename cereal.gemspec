# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cereal/version'

Gem::Specification.new do |spec|
  spec.name          = "cereal"
  spec.version       = Cereal::VERSION
  spec.authors       = ["Alex Barlow"]
  spec.email         = ["alexbarlowis@gmail.com"]
  spec.description   = "A simple was to seralize objects in Rails"
  spec.summary       = "A simple was to seralize objects in Rails"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~> 4.0.1"
  spec.add_dependency "activemodel", "~> 4.0.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "turn"
end
