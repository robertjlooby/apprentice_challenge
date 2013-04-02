class Calculator
	attr_reader :base
	def initialize(*args)
		# Defaults to base 10
		@base = 10
		# If there are args to initialize, 
		# and one of them is {base: ##}, use 
		# that as the base for the calculator
		unless args.nil?
			args.each do |a|
				if a.is_a?(Hash) && !a[:base].nil?
					@base = a[:base]
				end
			end
		end
		@val = 0
		# Keeps track of the last method 
		# called on it and the value passed
		@last_op = :input
		@last_op_val = 0
		# Keeps track of if equal was just called
		@last_eq = false
	end

	def input(n)
		@last_op = :input
		@last_eq = false
		@last_op_val = n
		@val = n
		self
	end

	def add(n)
		@last_op = :add
		@last_eq = false
		@last_op_val = n
		@val += n
		self
	end

	def subtract(n)
		@last_op = :subtract
		@last_eq = false
		@last_op_val = n
		@val -= n
		self
	end

	def equal
		if @last_eq
			self.send(@last_op, @last_op_val)
		end
		@last_eq = true
		@val
	end

	def clear
		@val = 0
		@last_op = :input
		@last_op_val = 0
		@last_eq = false
	end
end