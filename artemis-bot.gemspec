# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'artemis/bot/version'

Gem::Specification.new do |spec|
  spec.name          = "artemis-bot"
  spec.version       = Artemis::Bot::VERSION
  spec.authors       = ["Walter Reyes"]
  spec.email         = ["wal@icalialabs.com"]

  spec.summary       = %q{ Watson Conversation in Ruby}
  spec.description   = %q{ A Ruby wrapper for the Watson Conversation Service}
  spec.homepage      = "https://github.com/IcaliaLabs/artemis"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.14.0"
  spec.add_dependency "httmultiparty", "~> 0.3.16"
  spec.add_dependency "activesupport", "~> 4.0"
  spec.add_dependency "olimpo", "~> 0.1.0"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
