class Mastermind

	def initialize
		puts "How many digits would you like to play with?"
		@string_length = gets.chomp.to_i
		puts "How many guesses?"
		@number_of_guesses = gets.chomp.to_i
	end

	def random_number_picker
		x = 0
		@winning_array = []
		@string_length.times do
			@winning_array.push(rand(6))
		end
		@winning_array
	end
end


instance = Mastermind.new
puts instance.random_number_picker
