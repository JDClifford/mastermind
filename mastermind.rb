class Mastermind

	def initialize
		puts "To make the computer guess: Enter 1"
		puts "To guess yourself: Enter 2"
		$type_of_game = gets.chomp.to_i
		puts "How many digits would you like to play with?"
		@string_length = gets.chomp.to_i
		puts "How many guesses?"
		$number_of_guesses = gets.chomp.to_i
	end

	def computer_input #Computer AI chooses a random number
		input = []
		@string_length.times do
		input.push(rand(6))
		end
		@cpu_array = input
	end
	
	def user_input #Human user chooses a random number
		@user_array = []
		user_storage = ""
		user_int = 0
		while user_storage.length != @string_length
			puts "Please enter a #{@string_length} digit number:"
			user_storage = gets.chomp
			@user_array = user_storage.split("")
			unless user_storage.length == @string_length
				puts "Error: That is not the correct number of digits."
			end
		end
		@user_array.map! {|i| i = i.to_i}
	end

	def attempt_check #Checks to see if the Computer AI's number matches the user's number
		x = 0
		y = 0
		hints = []

		puts "KEY: ● = correct number in correct spot"
		puts "     ○ = correct number in incorrect spot"
		puts "     x = number not correct"
		unless @user_array != @cpu_array
			puts "Game over! The correct number was found!: #{@user_array}"
			exit
		end
		while x < @string_length
			if @cpu_array.include?(@user_array[x])
				if @cpu_array[x] == @user_array[x]
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
			if $type_of_game == 1
			print "#{@cpu_array[y]}: #{i} "
			puts ""
			y += 1
			else
			print "#{@user_array[y]}: #{i} "
			puts ""
			y += 1
			end
		end
	end
end

def plays_game #Loops through game for however many guesses the user has selected
	instance = Mastermind.new
	
	if $type_of_game == 2
		i = 0
		instance.computer_input
		until i == $number_of_guesses
			instance.user_input
			instance.attempt_check
			i += 1
		end
	else 
		i = 0
		instance.user_input
		until i == $number_of_guesses
			instance.computer_input
			instance.attempt_check
			i += 1
		end
	end
end

plays_game