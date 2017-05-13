class FizzBuzz
	def initialize(start_number = 0)
		@current = start_number
	end

	def next(n = 1)
		@current += 1
		"#{fizzbuzz(@current)}"
	end

	def fizzbuzz(x)
		msg = ''
		msg = msg + 'Fizz' if x%3==0
		msg = msg + 'Buzz' if x%5==0
		(msg.length > 0) ? msg : x
	end
end
