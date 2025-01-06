require 'json'
require_relative './student.rb'
require_relative './student_short.rb'
require_relative './students_list_base.rb'
require_relative './file_strategy.rb'

class JSONStrategy < FileStrategy
	def self.read_from_file(file_path)
		begin
			if !File.exist?(file_path)
				return []
			end
			File.open(file_path, 'r') do |file|
				file_content = file.read
				
				return [] if file_content.strip.empty?
				
				parsed_data = JSON.parse(file_content, symbolize_names: true)
				students_records = parsed_data.map { |record| Student.new(**record) }
				
				if parsed_data.is_a?(Array) && parsed_data.all? { |record| record.is_a?(Hash) }
					return students_records
				else
					raise StudentsListError, "Invalid JSON structure. Expected an array of hashes."
				end
			end
		rescue JSON::ParserError => parse_error
			raise StudentsListError, "Error parsing JSON: #{parse_error.message}"
		rescue StudentsListError => custom_error
			raise custom_error
		rescue StandardError => generic_error
			raise StudentsListError, "Unexpected error during file reading: #{generic_error.message}"
		end
	end
	
	def self.write_to_file(file_path, students)
		begin
			if students.nil? || !students.all? { |student| student.is_a?(Student) }
				raise StudentsListError, "Invalid students list. Ensure all entries are valid Student objects."
			end
			
			if file_path.nil? || file_path.empty?
				raise StudentsListError, "File path is not defined."
			end
			
			student_records = students.map { |student| student.to_h }
			
			File.open(file_path, 'w') do |file|
				file.write(JSON.pretty_generate(student_records))
			end
		rescue IOError => io_error
			raise StudentsListError, "Failed to write to file: #{io_error.message}"
		rescue JSON::GeneratorError => json_error
			raise StudentsListError, "Error generating JSON: #{json_error.message}"
		rescue StandardError => generic_error
			raise StudentsListError, "Unexpected error during file writing: #{generic_error.message}"
		end
	end
end
