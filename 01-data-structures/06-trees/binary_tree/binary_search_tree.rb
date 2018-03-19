require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node.rating > root.rating
      root.right.nil? ? root.right = node : insert(root.right, node)
    else
      root.left.nil? ? root.left = node : insert(root.left, node)
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root.nil?
      nil
    elsif root.title == data
      root
    else
      left_node = find(root.left, data)
      if left_node
        left_node
      else
        right_node = find(root.right, data)
        right_node if right_node
      end
    end
  end

  def delete(root, data)
    left_node = root.left
    right_node = root.right
    if left_node
      if left_node.title == data
        root.left = left_node.left
        insert(root, left_node.right) if left_node.right
        left_node.left = nil
        left_node.right = nil
      else
        delete(left_node, data)
      end
    end
    if right_node
      if right_node.title == data
        root.right = right_node.left
        insert(root, right_node.right) if right_node.right
        right_node.left = nil
        right_node.right = nil
      else
        delete(right_node, data)
      end
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    children = [@root] if children.nil?
    grand_children = []
    children.each do |node|
      puts "#{node.title}: #{node.rating}\n"
      grand_children.push(node.left) if node.left
      grand_children.push(node.right) if node.right
    end
    printf(grand_children) unless grand_children.empty?
  end
end
