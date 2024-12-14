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

def puts_opening_tags_bfs(tree)
    iterator = tree.bfs_iterator
    iterator.each { |node| puts node.opening_tag }
end

def puts_closing_tags_bfs(tree)
    iterator = tree.bfs_iterator
    iterator.each { |node| puts node.closing_tag }
end

def puts_opening_tags_dfs(tree)
    iterator = tree.dfs_iterator
    iterator.each { |node| puts node.opening_tag }
end

def puts_tags_bfs(tree)
    iterator = tree.bfs_iterator
    iterator.each { |node| puts node }
end

def puts_closing_tags_dfs(tree)
    iterator = tree.dfs_iterator
    iterator.each { |node| puts node }
end

def puts_tags_dfs(tree)
    iterator = tree.dfs_iterator
    iterator.each { |node| puts node }
end

begin
	html_content = read_html_file("example.html")
	tree = Tree.new(html_content)
	puts "The content of the html file:"
	puts html_content

	puts "\n\n"

	puts "BFS:"
	puts_tags_bfs(tree)

	puts "\n\n"

	puts "DFS:"
	puts_tags_dfs(tree)

rescue => exception
	puts "Error: #{exception.message}"
	exit
end