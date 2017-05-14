#!/usr/bin/env ruby

require 'optparse'

require_relative '../lib/fizzbuzz.rb'

def get_input(message)
	puts message
	gets.chomp
end

def guess?(input)
	input.length > 0
end

def run_next(buzzer)
	output_message = "\nPress Enter to get next value\n...or type your own and press Enter if you feel lucky!"
 	next_input = get_input(output_message)
 	actual = "#{buzzer.next()}"
 	if guess?(next_input)
 		if actual == next_input
 			puts "\nGood job!"
 		else
 			puts "\nActually the next one was: #{actual}"
 		end
 	else
 		puts "\nNext is: #{actual}"
 	end
end

options = {:name => nil, :age => nil}

parser = OptionParser.new do|opts|
	opts.banner = "Usage: years.rb [options]"
	opts.on('-v', '--initial_value initial_value', 'Initial Value') do |initial_value|
		options[:initial_value] = initial_value;
	end

	opts.on('-r', '--run run_number', 'Runs a few in a row') do |run_number|
		options[:run_number] = run_number;
	end

	opts.on('-h', '--help', 'Displays Help') do
		puts opts
		exit
	end
end

parser.parse!

if options[:initial_value] == nil
	print 'Enter Value: '
    options[:initial_value] = gets.chomp
end

puts "Welcome to FizzBuzz. Type ctrl-c to exit."
current_value = options[:initial_value].to_i
fzbz = FizzBuzz.new(current_value)
puts "Starting with #{current_value}"

if options[:run_number]
	puts "run #{options[:run_number]}"
	run_number = options[:run_number].to_i
	run_number.times { puts fzbz.next() }
else
	trap("SIGINT") { throw :ctrl_c }
	catch :ctrl_c do
		while true
			run_next(fzbz)
		end
	end
end

puts "\nGoodbye!"
