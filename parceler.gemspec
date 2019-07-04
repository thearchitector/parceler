lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "parceler/version"

Gem::Specification.new do |spec|
	spec.name          = "parceler"
	spec.version       = Parceler::VERSION
	spec.platform      = Gem::Platform::RUBY
	spec.authors       = ["Elias Gabriel"]
	spec.email         = ["me@eliasfgabriel.com"]
	spec.summary       = "A Parcel-based asset manager"
	spec.description   = "An alternative Parcel-powered asset manager and compiler, meant for Rails but built for Ruby."
	spec.homepage      = "https://github.com/thearchitector/parceler"

	spec.metadata["allowed_push_host"] = "https://rubygems.org"
	spec.metadata["homepage_uri"] = spec.metadata["source_code_uri"] = spec.homepage

	spec.require_paths = ["lib"]
	spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
		`git ls-files -z`.split("\x0")
	end

	spec.add_development_dependency "bundler", "~> 2.0"
	spec.add_development_dependency "rake", "~> 10.0"
end