# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'API42/version'

Gem::Specification.new do |spec|
  spec.name          = "API42"
  spec.version       = API42::VERSION
  spec.authors       = ["spuyet"]
  spec.email         = ["spuyet@student.42.fr"]

  spec.summary       = %q{A gem for the 42 API}
  spec.description   = %q{A simple ruby wrapper for 42 API}
  spec.homepage      = "https://github.com/spuyet/API42"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "rest-client", "~> 1.8"
  spec.add_runtime_dependency "json", "~> 1.8"

end
