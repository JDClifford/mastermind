class Mastermind

	def initialize
		puts "How many digits would you like to play with?"
		@string_length = gets.chomp.to_i
		puts "How many guesses?"
		$number_of_guesses = gets.chomp.to_i
	end

	def random_number_picker #Picks the winning array
		@winning_array = []
		@string_length.times do
			@winning_array.push(rand(6))
			@winning_array.map! {|i| i = i.to_s}
		end
	end

	
	def user_attempt #Allows the user to input their guess
		attempt_array = []
		attempt = ""
		attempt_int = 0
		while attempt.length != @string_length
			puts "Please enter a #{@string_length} digit number:"
			attempt = gets.chomp
			@attempt_array = attempt.split("")
			unless attempt.length == @string_length
				puts "Error: That is not the correct number of digits."
			end
		end
	end

	def attempt_check #Checks the accuracy of the guess
		x = 0
		y = 0
		hints = []
		unless @attempt_array != @winning_array
			puts "You win! The correct string is #{@winning_array}!"
			exit
		end
		while x < @string_length
			if @winning_array.include?(@attempt_array[x])
				if @winning_array[x] == @attempt_array[x]
					hints[x] = "●"
				else
					hints[x] = "○"
				end
				x += 1
			else
				hints[x] = "x"
				x += 1
			end
		end
		hints.each do |i|
			print "#{@attempt_array[y]}: #{i} "
			puts ""
			y += 1
		end
	end
end

def plays_game #Loops through game for however many guesses the user has selected
	instance = Mastermind.new
	i = 0
	instance.random_number_picker
	until i == $number_of_guesses
		instance.user_attempt
		instance.attempt_check
		i += 1
	end
end

plays_game