require "parceler/engine"
require "parceler/railtie" if defined?(Rails)

module Parceler
	class Error < StandardError; end
	class << self
		attr_accessor :configuration
		attr_accessor :engine
	end

	def self.configure
		self.configuration ||= Configuration.new
		yield(configuration)
		self.engine = Parceler::Engine.new(self.configuration)
	end

	# Configuration options defined here have direct relations to those defined in the official documentation
	# https://parceljs.org/cli.html
	class Configuration
		attr_accessor :entry_point, :destination, :cache, :source_maps, :minify, :content_hashing, :autoresolve

		def initialize
			@entry_point = "app/javascript/application.js"
			@destination = "public/parcels"
			@cache = nil
			@source_maps = false
			@minify = true
			@content_hashing = true
			@autoresolve = false
		end
	end
end