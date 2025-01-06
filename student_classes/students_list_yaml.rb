require 'yaml'
require_relative './student.rb'
require_relative './student_short.rb'
require_relative './students_list_base.rb'

class StudentsListYAML < StudentsListBase
	def read_from_file
		begin
			if !File.exist?(self.file_path)
				return []
			end
			File.open(self.file_path, 'r') do |file|
				file_content = file.read
				
				return [] if file_content.strip.empty?
				
				parsed_data = YAML.safe_load(file_content, permitted_classes: [Hash, Symbol])
				
				if parsed_data.is_a?(Array) && parsed_data.all? { |record| record.is_a?(Hash) }
					parsed_data.map { |record| add_student(Student.new(**record)) }
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
	
	def write_to_file
		begin
			if self.students.nil? || !self.students.all? { |student| student.is_a?(Student) }
				raise StudentsListError, "Invalid students list. Ensure all entries are valid Student objects."
			end
			
			if self.file_path.nil? || self.file_path.empty?
				raise StudentsListError, "File path is not defined."
			end
			
			student_records = self.students.map { |student| student.to_h }
			
			File.open(self.file_path, 'w') do |file|
				file.write(student_records.to_yaml)
			end
		rescue IOError => io_error
			raise StudentsListError, "Failed to write to file: #{io_error.message}"
		rescue StandardError => generic_error
			raise StudentsListError, "Unexpected error during file writing: #{generic_error.message}"
		end
	end
end
