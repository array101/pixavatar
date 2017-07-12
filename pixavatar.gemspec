Gem::Specification.new do |spec|
	spec.name			= 'pixavatar'
	spec.version		= '0.0.0'
	spec.date			= '2017-07-04'
	spec.summary		= 'generate unique pixel avatar for users'
	spec.authors		= ['Sandeep Acharya']
	spec.email			= 'acharya_sandeep@hotmail.com'
	spec.files			= ['lib/pixavatar.rb']
	spec.add_runtime_dependency 'chunky_png', '~> 1.3', '>= 1.4'
	spec.homepage	= 'https://github.com/array101/pixavatar'
	spec.license		= 'Beerware'
end
