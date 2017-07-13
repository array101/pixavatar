Gem::Specification.new do |spec|
	spec.name					= "pixavatar"
	spec.version			= "0.0.1"
	spec.date					= "2017-07-04"
	spec.summary			= "generate unique pixel avatar image"
	spec.description	= "Pixavatar is a simple placeholder image generator that can be used in placeholder images where avatar images are missing"
	spec.authors			= ["Sandeep"]
	spec.email				= "acharya_sandeep@hotmail.com"
	spec.files				= ["lib/pixavatar.rb"]
	spec.homepage			= "https://github.com/array101/pixavatar"
	spec.license			= "Beerware"
	spec.add_runtime_dependency("chunky_png", "~> 1.3")
end
