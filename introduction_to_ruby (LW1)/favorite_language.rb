if ARGV.length == 1
	puts "\nHello, #{ARGV[0]}! Nice to meet you!\n\n"
	
	puts "What is your favourite programming language?"
	language = $stdin.gets.chomp
	
	puts "\n"
	
	case language.downcase
        when 'ruby'
            puts 'Well, you\'re quite the kiss-up.'
        when 'python'
            puts 'Are you by any chance not after the "Python in 2 weeks" course?'
        when 'c++'
            puts 'Oh, you\'re a connoisseur!'
        when 'java'
            puts 'Minecraft?!'
        when 'assembler'
            puts 'This power is beyond my control!'
        else
            puts 'This is a programming language unknown to me...'
    end
	
	if language.downcase != 'ruby'
		puts "But don't worry, Ruby will come your way soon!"
	end
else
	puts "You must enter your name in arguments!"
end