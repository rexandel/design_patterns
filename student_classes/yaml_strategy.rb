require 'yaml'
require_relative './student.rb'
require_relative './student_short.rb'
require_relative './students_list_base.rb'
require_relative './file_strategy.rb'

class YAMLStrategy < FileStrategy
	def self.read_from_file(file_path)
		begin
			if !File.exist?(file_path)
				return []
			end
			File.open(file_path, 'r') do |file|
				file_content = file.read
				
				return [] if file_content.strip.empty?
				
				parsed_data = YAML.safe_load(file_content, permitted_classes: [Hash, Symbol])
				students_records = parsed_data.map { |record| Student.new(**record) }
				
				if parsed_data.is_a?(Array) && parsed_data.all? { |record| record.is_a?(Hash) }
					return students_records
				else
					raise StudentsListError, "Invalid YAML structure. Expected an array of hashes."
				end
			end
		rescue Psych::SyntaxError => parse_error
			raise StudentsListError, "Error parsing YAML: #{parse_error.message}"
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
				file.write(student_records.to_yaml)
			end
		rescue IOError => io_error
			raise StudentsListError, "Failed to write to file: #{io_error.message}"
		rescue StandardError => generic_error
			raise StudentsListError, "Unexpected error during file writing: #{generic_error.message}"
		end
	end
end
