require "./processing.rb"
require "./my_math.rb"

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

def replace_elements_before_min_element
	array = create_array
	puts "Result of the execution: #{Processing.replace_elements_before_min_element(array).join(' ')}"
end

def find_max_element_in_interval
	array = create_array
	print "Enter the lower limit of the interval: "
	range_start = gets.chomp.to_i
	print "Enter the upper limit of the interval: "
	range_end = gets.chomp.to_i
	max_element = Processing.find_max_element_in_interval(array, range_start, range_end)
	if max_element.nil?
		puts "There are no elements in this interval"
	else
		puts "Result of the execution: #{max_element}"
	end
end

def find_elements_less_than_left_neighbor
	array = create_array
	array_of_indices = Processing.find_elements_less_than_left_neighbor(array)
	puts "Indexes of elements: #{array_of_indices.join(' ')}"
	puts "The number of such elements: #{array_of_indices.size}"
end

def find_unique_prime_factors
	array = create_array
	if MyMath.all_positive?(array)
		puts "Result of the execution: #{Processing.find_unique_prime_factors(array).join(' ')}"
	else
		puts "Not all elements of the array are positive"
	end
end

def main
	loop do
		puts 'Select an action:'
		puts '1. Find the number of elements located after the maximum'
		puts '2. Place the elements located to the minimum at the end of the array'
		puts '3. Find the maximum of the elements in the interval'
		puts '4. Find the indexes of the elements that are smaller than their left neighbor, and the number of such numbers'
		puts '5. Print a list of all positive prime divisors of elements without repetitions'
		puts '0. Exit'

		print "Input your choice: "
		number_of_action = gets.chomp.to_i

		case number_of_action
		when 1
			puts "\n"
			find_count_of_elements_after_max_element
			puts "\n"
			puts "\n"
		when 2
			puts "\n"
			replace_elements_before_min_element
			puts "\n"
			puts "\n"
		when 3
			puts "\n"
			find_max_element_in_interval
			puts "\n"
			puts "\n"
		when 4
			puts "\n"
			find_elements_less_than_left_neighbor
			puts "\n"
			puts "\n"
		when 5
			puts "\n"
			find_unique_prime_factors
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
