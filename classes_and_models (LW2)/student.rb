class Student
	def initialize(surname, name, patronymic, id=nil, phone_number=nil, telegram=nil, email=nil, git=nil)
		self.id = id
		self.surname = surname
		self.name = name
		self.patronymic = patronymic
		self.phone_number = phone_number
		self.telegram = telegram
		self.email = email
		self.git = git
	end
	
	def id
		@id
	end
	
	def id=(new_value)
		@id = new_value
	end
	
	def surname
		@surname
	end
	
	def surname=(new_value)
		@surname = new_value
	end
	
	def name
		@name
	end
	
	def name=(new_value)
		@name = new_value
	end
	
	def patronymic
		@patronymic
	end
	
	def patronymic=(new_value)
		@patronymic = new_value
	end
	
	def phone_number
		@phone_number
	end
	
	def phone_number=(new_value)
		@phone_number = new_value
	end
	
	def telegram
		@telegram
	end
	
	def telegram=(new_value)
		@telegram = new_value
	end
	
	def email
		@email
	end
	
	def email=(new_value)
		@email = new_value
	end
	
	def git
		@git
	end
	
	def git=(new_value)
		@git = new_value
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
	