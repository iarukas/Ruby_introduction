class String
	def count_word
		ary = self.split(/\s+/)

		return ary.size
	end

	def return_ary
		ary = self.split(/\s+/)

		return ary
	end

end

str = "Just Another Ruby Newbie"
p str.count_word
p str.return_ary