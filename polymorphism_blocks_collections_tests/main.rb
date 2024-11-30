require "./processing.rb"

class EmptyArrayError < StandardError; end

def get_array_from_file(file_path)
	begin
		File.open(file_path, "r") do |file|
			file_content = file.read.chomp.gsub(";", "").gsub(",", "")
			array = file_content.split.map { |x| Integer(x) }
			raise EmptyArrayError, "The file is empty or does not contain valid numbers." if array.empty?
			return array
		end
	rescue => exception
		puts "Error: #{exception.message}"
		exit
	end
end

def get_array_from_keyboard
	begin
	input = gets.chomp.gsub(";", "").gsub(",", "")
	array = input.split.map { |x| Integer(x) }
	raise EmptyArrayError, "You must enter at least one number." if array.empty?
	return array
	rescue => exception
		puts "Error: #{exception.message}"
		exit
	end
end

def create_array
	array = Array.new
	puts 'Select the method of loading the array:'
	puts '1. From the keyboard'
	puts '2. From the file'
	loop do
		print "Input your choice: "
		choice = gets.chomp.to_i
		case choice
		when 1
			print "Input your array: "
			array = get_array_from_keyboard
			break
		when 2
			print "Enter the path to the file: "
			file_path = gets.chomp
			array = get_array_from_file(file_path)
			puts "Your array: #{array.join(' ')}"
			break
		else
			puts 'Incorrect choice. Try again, please'
		end
	end
	return array
end

def find_count_of_elements_after_max_element
	array = create_array
	puts "Result of the execution: #{Processing.find_count_of_elements_after_max_element(array)}"
end

def main
	loop do
		puts 'Select an action:'
		puts '1. Find the number of elements located after the maximum'
		puts '0. Exit'

		print "Input your choice: "
		number_of_action = gets.chomp.to_i

		case number_of_action
		when 1
			puts "\n"
			find_count_of_elements_after_max_element
			puts "\n"
			puts "\n"
		when 0
			puts "Goodbye!"
			exit
		else
			puts "\n"
			puts 'Incorrect entry of the action number'
			puts "\n"
			puts "\n"
		end
	end
end

main
