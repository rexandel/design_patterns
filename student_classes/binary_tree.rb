require './binary_tree_iterator'

class TreeNode
	attr_accessor :data, :left, :right
	
	def initialize(data)
		self.data = data
		self.left = nil
		self.right = nil
	end
end

class BinaryTree
	attr_accessor :root
	
	def iterator
		return BinaryTreeIterator.new(self.root)
	end
	
	def initialize
		self.root = nil
	end
	
	def append(data)
		if self.root.nil?
			self.root = TreeNode.new(data)
			return
		end
		append_node(self.root, data)
	end
	
	private
	
	def append_node(prev_node, data)
		if data < prev_node.data
			if prev_node.left.nil?
				prev_node.left = TreeNode.new(data)
				return
			end
			append_node(prev_node.left, data)
			return
		end
		
		if prev_node.right.nil?
			prev_node.right = TreeNode.new(data)
			return
		end
		append_node(prev_node.right, data)
	end
end
