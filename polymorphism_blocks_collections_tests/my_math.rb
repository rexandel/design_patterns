class MyMath
	def self.all_positive?(array)
		array.each do |x|
			return false if x <= 0
		end
		return true
	end

	def self.prime_factors(n)
		return (2..n).select do |i|
			if n % i == 0
				is_prime = true
				(2..Math.sqrt(i)).each do |j|
					if i % j == 0
						is_prime = false
						break
					end
				end
				if is_prime
					i
				end
			end
		end
	end
end
