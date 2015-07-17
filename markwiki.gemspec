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
  spec.description   = <<-EOF
    Markwiki is a Ruby gem designed to ease the development and maintenance of 
    locally designed static sites using Markdown. Too often, at least for me, 
    static site generators aren't intuitive to use, aren't focused for simple 
    static sites (not blogs), or most often don't support GitHub 
    flavoured Markdown (GFM).
    
    Markwiki is different in that it is a tool written by me, for me. However, 
    it may be useful for you if you want a simple static site with GFM.
  EOF
  spec.homepage      = "https://github.com/mahimahi42/markwiki"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", '~> 3'
  spec.add_development_dependency "yard", '~> 0'
  spec.add_development_dependency "guard", "~> 2"
  spec.add_development_dependency "guard-rspec", "~> 4"
  spec.add_development_dependency "coveralls", "~> 0"
  
  spec.add_runtime_dependency "json", '~> 1'
  spec.add_runtime_dependency "jewel", "~> 0"
end
