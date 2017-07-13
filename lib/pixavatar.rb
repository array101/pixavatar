# stdlib
require "digest/md5"

# third party
require "chunky_png"

class Pixavatar
	attr_accessor :avatar

	def initialize(input_term) 
		@term = input_term
		@term_hex = hashed_input
		@avatar = {
				color: get_color_code,
				grid: pixel_grid_matrix
			}
		@colorable_grid = colorable_grid_map
	end

	def self.draw_image(input_term)
		pixavatar_obj = self.new(input_term)
		pixavatar_obj.draw_and_save_image
	end
	
	# draw image pattern in png file and export		
	def draw_and_save_image
		color = @avatar[:color]
		png = ChunkyPNG::Image.new(250, 250, ChunkyPNG::Color::WHITE)
		color = ChunkyPNG::Color.rgba(color[:r], color[:g], color[:b], color[:alpha])
		@colorable_grid.each do |points|
			p1 = points[0]
			p2 = points[1]
			png.rect(p1[0], p1[1], p2[0], p2[1] , color, color)
		end
		png.save(File.join(Dir.pwd, "/#{@term}.png"), :interlace => true)
	end

	private 	

	# convert input string to MD5 hex digest and return decimal array of the digest
	def hashed_input
		md5_hex = Digest::MD5.hexdigest(@term)
		md5_hex.scan(/../).map { |s| s.to_i(16) }
	end

	# extract color code from the hex array	
	def get_color_code
		{ r: @term_hex[0], g: @term_hex[1], b: @term_hex[2], alpha: @term_hex[-1] }
	end
	
	# generate mirrored 5x5 row from the generated @term_hex
	def pixel_grid_matrix
		tmp = []
		@term_hex.slice(0,15).each_slice(3) do |row|
			tmp << row + row.reverse.slice(1,2) 
		end
		tmp.flatten
	end
	
	# filter colorable pixels from generated pixel grid
	def colorable_grid_map(color_option = :even)
		color_cordinates = []
		pixel_grid = @avatar[:grid].map.with_index(0) do |num, i|
			if num % 2 == 0
				horizontal = (i % 5) * 50
				vertical = (i / 5) * 50

				top_left = [horizontal, vertical]
				bottom_right = [horizontal + 50, vertical + 50]
				[ top_left, bottom_right ]
			end
		end
		pixel_grid.compact
	end
	
	
end

Pixavatar.draw_image('sandeep')


