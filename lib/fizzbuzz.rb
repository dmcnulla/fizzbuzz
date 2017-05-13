class FizzBuzz
	def initialize(start_number = 0)
		@current = start_number
	end

	def next(n = 1)
		msg = ''
		n.times do
			@current += 1
			msg += "#{fizzbuzz(@current)}\n"
		end
		msg
	end

	def fizzbuzz(x)
		msg = ''
		msg += 'Fizz' if x%3==0
		msg += 'Buzz' if x%5==0
		(msg.length > 0) ? msg : x
	end
end
