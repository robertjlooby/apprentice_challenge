class Calculator
	attr_reader :base
	def initialize(base: 10)
		# Defaults to base 10
		@base = base
		# Current value stored internally in base 10
		@val = 0
		# Keeps track of the last method 
		# called on it and the value passed
		@last_op = :input
		@last_op_val = 0
		# Keeps track of if equal was just called
		@last_eq = false
	end

	# Converts the input from base @base to base 10
	# Works for any base <= 10
	def baseNToBase10(n)
		str = n.to_s
		dec = 0
		num = 0
		until str.length == 0
			num += (@base**dec)*str.slice!(str.length-1).to_i
			dec += 1
		end
		num
	end

	def input(n)
		@last_op = :input
		@last_eq = false
		@last_op_val = n
		@val = baseNToBase10(n)
		self
	end

	def add(n)
		@last_op = :add
		@last_eq = false
		@last_op_val = n
		@val += baseNToBase10(n)
		self
	end

	def subtract(n)
		@last_op = :subtract
		@last_eq = false
		@last_op_val = n
		@val -= baseNToBase10(n)
		self
	end

	def equal
		if @last_eq
			self.send(@last_op, @last_op_val)
		end
		@last_eq = true
		# Converts from the base 10 value to a string
		# representation of the base @base value, then
		# to an integer. Works for any base <= 10
		@val.to_s(@base).to_i
	end

	def clear
		@val = 0
		@last_op = :input
		@last_op_val = 0
		@last_eq = false
		self
	end
end
