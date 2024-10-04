class Student
	attr_reader :id, :surname, :name, :patronymic, :phone_number, :telegram, :email, :git
	attr_writer :id, :surname, :name, :patronymic, :phone_number, :telegram, :email, :git

	def initialize(surname, name, patronymic, id=nil, phone_number=nil, telegram=nil, email=nil, git=nil)
		@id = id
		@surname = surname
		@name = name
		@patronymic = patronymic
		@phone_number = phone_number
		@telegram = telegram
		@email = email
		@git = git
	end
	
	def print_info
		puts "----------------------------------------"
		
		puts "ID: #{@id ? @id : "Not specified"}"
		puts "Surname: #{@surname ? @surname : "Not specified"}"
		puts "Name: #{@name ? @name : "Not specified"}"
		puts "Patronymic: #{@patronymic ? @patronymic : "Not specified"}"
		puts "Phone number: #{@phone_number ? @phone_number : "Not specified"}"
		puts "Telegram: #{@telegram ? @telegram : "Not specified"}"
		puts "Email: #{@email ? @email : "Not specified"}"
		puts "Git: #{@git ? @git : "Not specified"}"
		
		puts "----------------------------------------"
	end
end
	