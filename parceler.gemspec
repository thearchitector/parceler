lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
	spec.name          = "parceler"
	spec.version       = "1.0.4"
	spec.platform      = Gem::Platform::RUBY
	spec.author        = "Elias Gabriel"
	spec.email         = "me@eliasfgabriel.com"
	spec.summary       = "A Parcel-based asset manager"
	spec.description   = "An alternative Parcel-powered asset manager and compiler, meant for Rails but built for Ruby."
	spec.homepage      = "https://github.com/thearchitector/parceler"
	spec.license       = "BSD-3-Clause"

	spec.metadata["allowed_push_host"] = "https://rubygems.org"
	spec.metadata["homepage_uri"] = spec.metadata["source_code_uri"] = spec.homepage
	spec.extra_rdoc_files = ["README.md"]

	spec.requirements = ["Node.js", "Yarn"]

	spec.require_paths = ["lib"]
	spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
		`git ls-files -z`.split("\x0")
	end

	spec.required_ruby_version = '>= 1.9'

	spec.add_runtime_dependency "posix-spawn", '~> 0.3'
	spec.add_development_dependency "bundler", '~> 2.0'
	spec.add_development_dependency "rake", '~> 10.0'
end