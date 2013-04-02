class String
	def ==(obj)
		obj.is_a?(String) && ((self <=> obj) == 0 || (self <=> obj.reverse) == 0)
	end
end

class Array
	def uniquely_sorted
		self.uniq.sort
	end
end

class Fish
	attr_reader :name
	def initialize(name)
		@name = name
	end

	def ==(obj)
		obj.is_a?(Fish) && @name == obj.name
	end
end