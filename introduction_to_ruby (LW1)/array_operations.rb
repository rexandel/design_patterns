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