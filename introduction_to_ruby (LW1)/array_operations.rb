def find_min_for(array)
    minimum = array[0]
    min_index = 0

    for index in 1...array.length
        if array[index] < minimum
            minimum = array[index]
            min_index = index
        end
    end
    return minimum, min_index
end


def find_min_while(array)
    minimum = array[0]
    min_index = 0

    index = 0
    while index != array.length
        if array[index] < minimum
            minimum = array[index]
            min_index = index
        end
        index += 1
    end
    return minimum, min_index
end


def find_element_for(array, element)
    for index in 0...array.length
        if array[index] == element
            return index
        end
    end
    return -1
end


def find_element_while(array, element)
    index = 0
    while index != array.length
        if array[index] == element
            return index
        end
        index += 1
    end
    return -1
end


def find_first_positive_for(array)
    for index in 0...array.length
        if array[index] > 0
            return array[index], index
        end
    end
    return -1, -1
end


def find_first_positive_while(array)
    index = 0
    while index != array.length
        if array[index] > 0
            return array[index], index
        end
        index += 1
    end
    return -1, -1
end


def read_array_from_file(filename)
	begin
		content = File.read(filename).chomp.gsub(";", "").gsub(",", "")	
		array = content.split
		
		for index in 0...array.length
			array[index] = array[index].to_i
		end
		
		return array
	rescue => e
		puts "Error: #{e.message}"
		exit
	end
end


if ARGV.length == 2
    action = ARGV[0].to_i
    filename = ARGV[1]

	puts "\n"

    if action.between?(1, 6)
        array = read_array_from_file(filename)
		
		if array.length != 0
			puts "Array from file: #{array}."
		else
			puts "Array is empty."
			exit
		end
		
		puts "\n"
		
        case action
			when 1
				minimum, min_index = find_min_for(array)
				puts "The minimum element found using a for loop is #{minimum}. Its index is #{min_index}."
			when 2
				minimum, min_index = find_min_while(array)
				puts "The minimum element found using a while loop is #{minimum}. Its index is #{min_index}."
			when 3
				puts "Enter the element you are looking for: "
				element = $stdin.gets.chomp.to_i
				index = find_element_for(array, element)
				if index == -1
					puts "\n"
					puts "The element is not in the array."
				else
					puts "The index of the sought element found using a for loop is #{index}."
				end
			when 4
				puts "Enter the element you are looking for: "
				element = $stdin.gets.chomp.to_i
				index = find_element_while(array, element)
				if index == -1
					puts "\n"
					puts "The element is not in the array."
				else
					puts "The index of the sought element found using a for loop is #{index}."
				end
			when 5
				value, index = find_first_positive_for(array)
				if index == -1
					puts "\n"
					puts "There are no positive elements in the array."
				else
					puts "The first positive element found using a for loop is #{value}. Its index is #{index}."
				end
			when 6
				value, index = find_first_positive_while(array)
				if index == -1
					puts "\n"
					puts "There are no positive elements in the array."
				else
					puts "The first positive element found using a for loop is #{value}. Its index is #{index}."
				end
        end
    else
		puts "Invalid action number. Please enter a number between 1 and 6."
    end
else
	puts "\n"
	puts "Enter the action number and the file path where the array is stored."
	puts "Available actions:"
	puts "1) Find the minimum element of the array using a for loop"
	puts "2) Find the minimum element of the array using a while loop"
	puts "3) Find a specific element of the array using a for loop"
	puts "4) Find a specific element of the array using a while loop"
	puts "5) Find the first positive element of the array using a for loop"
	puts "6) Find the first positive element of the array using a while loop"
end