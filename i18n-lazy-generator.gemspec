# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'i18n-lazy-generator/version'

Gem::Specification.new do |spec|
  spec.name          = "i18n-lazy-generator"
  spec.version       = I18n::Lazy::Generator::VERSION
  spec.authors       = ["SarCasm"]
  spec.email         = ["sarcasm008@gmail.com"]

  spec.summary       = %q{Generating basic translation keys and using them in original file}
  spec.description   = %q{Gem designed to automatically generate base locale .yml file and overwrite original HTML/HAML file using new keys.}
  spec.homepage      = "https://github.com/iSarCasm/i18n-lazy-generator"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
