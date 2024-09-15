def is_prime?(number)
	if number <= 1
		return false
	else
		for divisor in 2...number
			if number % divisor == 0 
				return false
			end
		end
	end
	return true
end


def sum_of_prime_divisors(number)
	total = 0
	for divisor in 2..number
		if number % divisor == 0 and is_prime?(divisor)
			total += divisor
		end
	end
	return total
end


puts "\nEnter a number: "
number = $stdin.gets.chomp

integer_part = number.to_i
integer_as_string = integer_part.to_s

if integer_as_string == number && integer_part != 0
	puts "\n"
	puts "The sum of the prime divisors of the number #{integer_part} is #{sum_of_prime_divisors(integer_part)}."
else
	puts "\n"
	puts "The input is not a valid number."
end