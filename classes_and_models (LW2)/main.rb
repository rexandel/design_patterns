require './student.rb'

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
					email: "ivan_dev@gmail.com",
					git: "https://github.com/ivan")

	third_student = Student.new(
					id: 3,
					surname: "Petrov",
					name: "Alexey",
					patronymic: "Romanovich",
					telegram: "@alex_ey",
					email: "alexey_2003@gmail.com",
					git: "https://github.com/all_exay")

	first_student.print_info
	second_student.print_info
	third_student.print_info

rescue ArgumentError => e
  puts "Error: #{e.message}"
end