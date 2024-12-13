require "./tag.rb"
require "./tree.rb"

class EmptyHTMLFileError < StandardError; end

def read_html_file(file_path)
	begin
		File.open(file_path, "r") do |file|
			html_string = file.read
			if html_string.empty?
				raise EmptyHTMLFileError, "The HTML file is empty."
			end
			return html_string
		end
	rescue => exception
		puts "Error: #{exception.message}"
		exit
	end
end

begin
	html_content = read_html_file("example.html")
	tree = Tree.new(html_content)
	puts "The content of the html file:"
	puts html_content

rescue => exception
	puts "Error: #{exception.message}"
	exit
end