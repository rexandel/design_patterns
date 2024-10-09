require_relative 'student.rb'

begin
	first_student = Student.new(
					id: 1,
					surname: "Sidorenko",
					name: "Alexander",
					patronymic: "Andreevich",
					phone_number: "+7(989)-655-77-11",
					telegram: "@rexandel",
					git: "https://github.com/rexandel")

	second_student = Student.new(
					id: 2,
					surname: "Ivanov",
					name: "Ivan",
					patronymic: "Ivanovich",
					phone_number: "+7(977)-755-42-12",
					telegram: "@ivan_develop",
					email: "ivan_dev@gmail.com")

	third_student = Student.new(
					id: 3,
					surname: "Petrov",
					name: "Alexey",
					patronymic: "Romanovich",
					email: "alexey_2003@gmail.com",
					git: "https://github.com/all_exay")
	
	fourth_student = Student.new(
					id: 4,
					surname: "Ivanov",
					name: "Sergey",
					patronymic: "Dmitrievich")

	puts first_student
	puts second_student
	puts third_student
	puts fourth_student

rescue ArgumentError => e
	puts "Error: #{e.message}"
end