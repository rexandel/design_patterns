require_relative 'person.rb'
require_relative 'student.rb'
require_relative 'student_short.rb'
require_relative 'binary_tree.rb'
require_relative 'data_table.rb'
require_relative 'data_list_student_short.rb'
require_relative 'student_list_json.rb'

begin
	first_student = Student.new(
		id: 1,
		surname: "Sidorenko",
		name: "Alexander",
		patronymic: "Andreevich",
		phone_number: "+7(989)-655-77-11",
		telegram: "@rexandel",
		git: "https://github.com/rexandel",
		birthdate: "06.11.1995"
	)
	
	second_student = Student.new(
		id: 2,
		surname: "Ivanov",
		name: "Ivan",
		patronymic: "Ivanovich",
		phone_number: "+7(977)-755-42-12",
		telegram: "@ivan_develop",
		email: "ivan_dev@gmail.com",
		birthdate: "08.12.1999"
	)
	
	third_student = Student.new(
		id: 3,
		surname: "Petrov",
		name: "Alexey",
		patronymic: "Romanovich",
		email: "alexey_2003@gmail.com",
		birthdate: "16.11.2005"
	)
	
	fourth_student = Student.new(
		id: 4,
		surname: "Ivanov",
		name: "Sergey",
		patronymic: "Dmitrievich"
	)
	
	fifth_student = Student.new(
		id: 5,
		surname: "Smirnov",
		name: "Dmitry",
		patronymic: "Vladimirovich",
		phone_number: "+7(915)-123-45-67",
		telegram: "@dmitry_smirnov",
		email: "dmitry_smirnov@gmail.com",
		git: "https://github.com/dsmirnov",
		birthdate: "14.02.1998"
	)
	
	sixth_student = Student.new(
		id: 6,
		surname: "Vasiliev",
		name: "Nikolay",
		patronymic: "Petrovich",
		phone_number: "+7(901)-333-22-11",
		email: "nikolay_vasiliev@gmail.com",
		git: "https://github.com/nikolay_vasiliev",
		birthdate: "21.03.1997"
	)
	
	seventh_student = Student.new(
		id: 7,
		surname: "Sokolov",
		name: "Andrey",
		patronymic: "Igorevich",
		telegram: "@andrey_sokolov",
		git: "https://github.com/andreysokolov",
		birthdate: "05.08.2000"
	)
	
	eighth_student = Student.new(
		id: 8,
		surname: "Kuznetsov",
		name: "Roman",
		patronymic: "Sergeevich",
		phone_number: "+7(903)-777-66-55",
		telegram: "@roman_kuznetsov",
		birthdate: "12.04.1996"
	)
	
	ninth_student = Student.new(
		id: 9,
		surname: "Popov",
		name: "Egor",
		patronymic: "Vladimirovich",
		email: "egor_popov@gmail.com",
		git: "https://github.com/egorpopov",
		birthdate: "30.06.1995"
	)
	
	tenth_student = Student.new(
		id: 10,
		surname: "Novikov",
		name: "Mikhail",
		patronymic: "Olegovich",
		phone_number: "+7(905)-555-44-33",
		email: "mikhail_novikov@gmail.com",
		git: "https://github.com/mikhailnovikov",
		birthdate: "17.09.1994"
	)
	
	array_of_students = [
		first_student,
		second_student,
		third_student,
		fourth_student,
		fifth_student,
		sixth_student,
		seventh_student,
		eighth_student,
		ninth_student,
		tenth_student
	]
	
	file_name = 'students.json'
	student_list_json_write = StudentsListJSON.new(file_name)
	
	array_of_students.each { |student| student_list_json_write.students << student }
	
	student_list_json_write.write_to_file
	
	student_list_json_read = StudentsListJSON.new(file_name)
	
	student_list_json_read.read_from_file
	
	puts "\n\n"
	
	puts "All Students:"
	
	puts student_list_json_read.students
	
	puts "\n\n"
	
	puts "Requested Student:"
	
	puts student_list_json_read.get_student_by_id(3)

rescue StandardError => e
	puts "Error: #{e.message}"
end
