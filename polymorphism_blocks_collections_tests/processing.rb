class Processing
	def self.find_count_of_elements_after_max_element(array)
		max_el = array.max { |a, b| a <=> b }
		max_el_index = array.rindex { |element| element == max_el }
		return array.size - max_el_index - 1
	end

	def self.replace_elements_before_min_element(array)
		min_el = array.min { |a, b| a <=> b }
		min_el_index = array.index { |element| element == min_el }
		return array.rotate(min_el_index)
	end
end
