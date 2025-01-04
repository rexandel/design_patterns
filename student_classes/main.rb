require_relative 'person.rb'
require_relative 'student.rb'
require_relative 'student_short.rb'
require_relative 'binary_tree.rb'
require_relative 'data_table.rb'
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
	
	
	first_student_short = StudentShort.new_from_student_object(first_student)
	second_student_short = StudentShort.new_from_string(string: "Surname and initials: Sidorenko A. A. | Git: https://github.com/rexandel | Contact: +7(989)-655-77-11", id: 2)
	third_student_short = StudentShort.new_from_string(string: "Surname and initials: Nevchenko A. S. | Git: https://github.com/neva | Contact: +7(777)-555-44-22", id: 3)
	fourth_student_short = StudentShort.new_from_string(string: "Surname and initials: Kolosov S. S. | Git: Not specified | Contact: Not specified", id: 4)
	fifth_student_short = StudentShort.new_from_string(string: "Surname and initials: Ivanov I. I. | Git: https://github.com/ivanovii | Contact: ivanov@example.com", id: 5)
	sixth_student_short = StudentShort.new_from_string(string: "Surname and initials: Petrova P. P. | Git: https://github.com/ppetrova | Contact: @ppetrova", id: 6)
	seventh_student_short = StudentShort.new_from_string(string: "Surname and initials: Sidorov S. S. | Git: https://github.com/sidorovss | Contact: +7(921)-123-45-67", id: 7)
	eighth_student_short = StudentShort.new_from_string(string: "Surname and initials: Orlova O. O. | Git: https://github.com/orlovao | Contact: +7(800)-555-00-11", id: 8)
	ninth_student_short = StudentShort.new_from_string(string: "Surname and initials: Kuznetsov K. K. | Git: https://github.com/kuznetsovkk | Contact: kuznetsov@example.com", id: 9)
	tenth_student_short = StudentShort.new_from_string(string: "Surname and initials: Smirnova S. S. | Git: https://github.com/ssmirnova | Contact: @ssmirnova", id: 10)
	
	
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
	
	
	data_list_student_short = [
		first_student_short,
		second_student_short,
		third_student_short,
		fourth_student_short,
		fifth_student_short,
		sixth_student_short,
		seventh_student_short,
		eighth_student_short,
		ninth_student_short,
		tenth_student_short
	]
	
	data_list_student_short_obj = DataListStudentShort.new(data_list_student_short)
	
	puts "\n\n"
	
	selected_student_short_obj = [0, 4, 5, 6, 7]
	selected_student_short_obj.each { |student_short_obj| data_list_student_short_obj.select(student_short_obj) }
	
	data_table = data_list_student_short_obj.get_data
	
	puts data_table

rescue StandardError => e
	puts "Error: #{e.message}"
end
