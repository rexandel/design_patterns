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
	for divisor in 2...number
		if number % divisor == 0 and is_prime?(divisor)
			total += divisor
		end
	end
	return total
end


def count_odd_digits_greater_than_three(number)
	count = 0
	while number > 0
		digit = number % 10
		if digit > 3 and digit % 2 != 0
			count += 1
		end
		number /= 10
	end
	return count
end


def sum_of_digits(number)
	total = 0
	while number > 0
		digit = number % 10
		total += digit
		number /= 10
	end
	return total
end


def product_of_divisors_with_digit_sum_less_than_number(number)
	if number <= 1
		return 0
	end
	product = 1
	for divisor in 1..number
		if number % divisor == 0 and sum_of_digits(divisor) < sum_of_digits(number)
			product *= divisor
		end
	end
	return product
end


puts "\nEnter a number: "
number = $stdin.gets.chomp

integer_part = number.to_i
integer_as_string = integer_part.to_s

if integer_as_string == number && integer_part != 0 && integer_part > 0
	puts "\n"
	puts "The sum of the prime divisors of the number #{integer_part} is #{sum_of_prime_divisors(integer_part)}."
	puts "The number of odd digits in #{integer_part} that are greater than 3 is #{count_odd_digits_greater_than_three(integer_part)}."
	puts "The product of the divisors of the number #{integer_part} whose digit sum is less than the sum of the digits of the original number is #{product_of_divisors_with_digit_sum_less_than_number(integer_part)}."
else
	puts "\n"
	puts "The input is not a valid number."
end