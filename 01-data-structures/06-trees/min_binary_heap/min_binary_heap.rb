require_relative 'node'

class MinBinaryHeap
  attr_accessor :root
  attr_accessor :tree_array

  def initialize(root)
    @root = root
    @tree_array = [root]
  end

  def insert(root, data)
    @tree_array.push(data)
    up_heap
  end

  def find(root, data)
    result = nil
    @tree_array.each do |node|
      result = node if node.title == data
    end
    result
  end

  def delete(root, data)
    return nil if data.nil?

    node = find(root, data)
    index = @tree_array.index(node)
    last_node = @tree_array.last

    @tree_array[index] = last_node
    @tree_array.pop
    parent_node = @tree_array[(index - 1) / 2]
    if parent_node.rating > last_node.rating
      up_heap
    else
      down_heap(index)
    end
  end

  def print(root)
    @tree_array.each do |node|
      puts "#{node.title}: #{node.rating}\n"
    end
    nil
  end

  private
  def up_heap
    latest_node_index = @tree_array.size - 1
    parent_node_index = (latest_node_index - 1) / 2

    while @tree_array[latest_node_index].rating < @tree_array[parent_node_index].rating
      temp = @tree_array[latest_node_index]
      @tree_array[latest_node_index] = @tree_array[parent_node_index]
      @tree_array[parent_node_index] = temp

      if parent_node_index != 0
        latest_node_index = parent_node_index
        parent_node_index = (latest_node_index - 1) / 2
      end

    end
    @root = @tree_array.first

    # @tree_array.each_with_index do |node, index|
    #   node.left = @tree_array[2 * index + 1]
    #   node.right = @tree_array[2 * index + 2]
    # end
  end

  def down_heap(replaced_index)
    parent_node = @tree_array[replaced_index]
    left_index = 2 * replaced_index + 1
    right_index = 2 * replaced_index + 2

    left_child = @tree_array[left_index]
    right_child = @tree_array[right_index]

    if left_child.nil?
      return
    elsif parent_node.rating > left_child.rating
      # left child is the smallest node
      if right_child.nil? || left_child.rating < right_child.rating
        swap(replaced_index, left_index)
        down_heap(left_index)
      end
    elsif parent_node.rating < left_child.rating
      # Parent node is the smallest node
      if right_child.nil? || left_child.rating < right_child.rating
        return
      end
    # Right child is the smallest node
    else
      swap(replaced_index, right_index)
      down_heap(right_index)
    end
  end

  def swap(index1, index2)
    temp = @tree_array[index1]
    @tree_array[index1] = @tree_array[index2]
    @tree_array[index2] = temp
  end
end
