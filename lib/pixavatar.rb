require 'digest/md5'

class Pixavatar
	attr_accessor :avatar

	def initialize(input_term) 
		@term = input_term
		@avatar = {
				hex: hashed_input
			}
	end
	
	# convert input string to MD5 hex digest and return decimal array of the digest
	def hashed_input
		md5_hex = Digest::MD5.hexdigest(@term)
		md5_hex.scan(/../).map { |s| s.to_i(16) }
	end
end

tmp = Pixavatar.new('banana')
p tmp.inspect

