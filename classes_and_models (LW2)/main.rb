require './student.rb'

first_student = Student.new("Sidorenko", "Alexander", "Andreevich", 1, "+7(989)-655-77-11", "@rexandel", nil, "https://github.com/rexandel")
second_student = Student.new("Ivanov", "Ivan", "Ivanovich", 2, "+7(977)-755-42-12", "@ivan", "ivan_dev@gmail.com", "https://github.com/ivan")
third_student = Student.new("Petrov", "Alexey", "Romanovich", 3, nil, "@alex_ey", "alexey_2003@gmail.com", "https://github.com/all_exay")

first_student.print_info
second_student.print_info
third_student.print_info