require 'json'
require_relative './student.rb'
require_relative './student_short.rb'

class StudentsListError < StandardError; end

class StudentsListJSON
	attr_accessor :file_path, :students
	
	def initialize(file_path)
        self.file_path = file_path
        self.students = []
    end
	
	def read_from_file
		begin
			if !File.exist?(self.file_path)
				return []
			end
			File.open(self.file_path, 'r') do |file|
				file_content = file.read
				
				return [] if file_content.strip.empty?
				
				parsed_data = JSON.parse(file_content, symbolize_names: true)
				
				if parsed_data.is_a?(Array) && parsed_data.all? { |record| record.is_a?(Hash) }
					self.students = parsed_data.map { |record| Student.new(**record) }
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