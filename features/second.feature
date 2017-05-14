Feature: Run using interactive mode.

@interactive
Scenario: Select start number
	Given I run `main.rb` interactively
	When I type "14"
	And I type "1"
	Then the output should contain "FizzBuzz"
	When I type "quit"
	And the exit status should not be 0
