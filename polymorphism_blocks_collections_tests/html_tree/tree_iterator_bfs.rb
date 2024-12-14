require './tree_iterator.rb'

class TreeIteratorBFS < TreeIterator
	private

	def enumerator
		Enumerator.new do |yielder|
			queue = [self.root]
			while not queue.empty?
				current = queue.shift
				yielder << current
				current.children.each { |child| queue.push(child) } unless current.children.nil?
			end
		end
	end
end
