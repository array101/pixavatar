# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pixavatar/version"

Gem::Specification.new do |s|
	s.name			= "pixavatar"
	s.version		= Pixavatar::VERSION
	s.summary		= "generate unique pixel avatar image"
	s.description		= "Pixavatar is a simple placeholder image generator that can be used as filler images where avatar images are missing"
	s.authors		= ["Sandeep"]
	s.email			= "acharya_sandeep@hotmail.com"
	s.homepage		= "https://github.com/array101/pixavatar"
	s.license		= "Beerware"

	s.files			= `git ls-files -z`.split("\x0")
	s.executables		= s.files.grep(%r{^bin/}) { |f| File.basename(f) }
	s.test_files		= s.files.grep(%r{^(test|spec|features)/})
	
	s.add_development_dependency("rspec", "~> 3")
	s.add_development_dependency("pry", "~> 0")	

	s.add_runtime_dependency("chunky_png", "~> 1.3")
end

