Feature: Run a few fizz buzzes in a row.

@always
Scenario: Introduction
	When I run `main.rb -v 1 -r 1`
	Then the output should contain "Welcome to FizzBuzz"
	And  the output should contain "Type ctrl-c to exit."
	And  the output should contain "run 1"

@always
Scenario: Exit
	When I run `main.rb -v 1 -r 1`
	Then the output should contain "Goodbye!"

@sometimes
Scenario Outline: Run with initial value & number of times
	When I run `main.rb -v <start> -r <count>`
	Then the output should contain "<output>"
	Examples:
	| start | count | output                     |
	| 1     | 5     | 2\nFizz\n4\nBuzz\nFizz     |
	| 2     | 5     | Fizz                       |
	| 4     | 1     | Buzz                       |
	| 10    | 5     | 11\nFizz\n13\n14\nFizzBuzz |
