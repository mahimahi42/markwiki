# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'markwiki/version'

Gem::Specification.new do |spec|
  spec.name          = "markwiki"
  spec.version       = Markwiki::VERSION
  spec.authors       = ["Bryce Davis"]
  spec.email         = ["me@bryceadavis.com"]

  spec.summary       = %q{Ruby utility for managing wiki-like sites with Markdown.}
  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/mahimahi42/markwiki"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "json"
  
  spec.add_runtime_dependency "json"
end
