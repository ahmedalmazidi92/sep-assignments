require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size) { LinkedList.new() }
    @item_count = 0.0
  end

  def []=(key, value)
    new_index = index(key, size)
    @items[new_index].add_to_front(Node.new(key, value))
    @item_count+= 1
    while load_factor > @max_load_factor
      resize
    end
  end

  def [](key)
    new_index = index(key, size)
    current_node = @items[new_index].head
    while current_node && current_node.key != key
      current_node = current_node.next
    end
    current_node.value if current_node
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    @item_count/ size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
    new_array = Array.new(size * 2) { LinkedList.new() }
    @items.each do |llist|
      current_node = llist.head
      while current_node
        new_index = index(current_node.key, new_array.size)
        new_array[new_index].add_to_front(Node.new(current_node.key, current_node.value))
        current_node = current_node.next
      end
    end
    @items = new_array
  end

  def print
    @items.each_with_index do |item, index|
      puts "Index: #{index}, #{item.print}" if item
    end
    puts "Load Factor: #{load_factor}"
  end
end
