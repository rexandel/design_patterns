require_relative 'person.rb'
require_relative 'student.rb'
require_relative 'student_short.rb'
require_relative 'binary_tree.rb'
require_relative 'data_table.rb'
require_relative 'data_list.rb'
require_relative 'data_list_student_short.rb'

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

	puts first_student
	puts second_student
	puts third_student
	puts fourth_student

	puts first_student.get_info
	puts second_student.get_info
	puts third_student.get_info
	puts fourth_student.get_info

	first_student_short = StudentShort.new_from_student_object(first_student)

	puts first_student_short

	fifth_student_short = StudentShort.new_from_string(string: "Surname and initials: Sidorenko A. A. | Git: https://github.com/rexandel | Contact: +7(989)-655-77-11", id: 5)
	sixth_student_short = StudentShort.new_from_string(string: "Surname and initials: Nevchenko A. S. | Git: https://github.com/neva | Contact: +7(777)-555-44-22", id: 6)
	seventh_student_short = StudentShort.new_from_string(string: "Surname and initials: Kolosov S. S. | Git: Not specified | Contact: Not specified", id: 7)

	puts fifth_student_short
	puts sixth_student_short
	puts seventh_student_short


	age_tree = BinaryTree.new

	age_tree.append(first_student)
	age_tree.append(second_student)
	age_tree.append(third_student)
	age_tree.append(fourth_student)

	puts "\n\n"

	puts "Sorted Students by Age:"
	iterator = age_tree.iterator
	iterator.each { |data| puts data }


	digit_tree = BinaryTree.new

	digit_tree.append(2)
	digit_tree.append(4)
	digit_tree.append(1)
	digit_tree.append(23)
	digit_tree.append(10)

	puts "\n\n"

	puts "Sorted Digits:"
	iterator = digit_tree.iterator
	iterator.each { |data| puts data }

	puts "\n\n"

	puts "Digits > 3:"
	iterator = digit_tree.iterator
	iterator.select { |elem| elem > 3}.each { |data| puts data }

rescue ArgumentError => e
	puts "Error: #{e.message}"
end
