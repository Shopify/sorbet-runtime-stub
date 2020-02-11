# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "sorbet-runtime-stub"
  spec.version       = "0.1.3"
  spec.authors       = ["Shopify"]
  spec.email         = ["ruby@shopify.com"]

  spec.summary       = "A stub definition provider for Sorbet runtime dependencies"
  spec.homepage      = "https://github.com/Shopify/sorbet-runtime-stub"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "no"

  spec.bindir        = "exe"
  spec.executables   = []
  spec.require_paths = ["lib"]

  spec.files         = Dir.glob("lib/**/*.rb") + %w(
    README.md
    Gemfile
    Rakefile
  )
end
