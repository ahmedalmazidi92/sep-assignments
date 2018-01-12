require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    new_index = index(key, @items.size)
    if @items[new_index]
      new_index = next_open_index(new_index)
      while new_index == -1
        resize
        new_index = index(key, @items.size)
        new_index = next_open_index(new_index)
      end
    end
    @items[new_index] = Node.new(key, value)
  end

  def [](key)
    new_index = index(key, @items.size)
    if @items[new_index]
      while @items[new_index].key != key
        new_index += 1
      end
      @items[new_index].value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    while @items[index]
      index += 1
      if index == @items.size
        return -1
      end
    end
    index
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
    new_array = Array.new(@items.size * 2)
    @items.each do |item|
      if item
        new_index = index(item.key, new_array.size)
        new_array[new_index] = item
      end
    end
    @items = new_array
  end

  def print
    @items.each_with_index do |item, index|
      puts "Index: #{index}, Key: #{item.key}, Value: #{item.value}" unless item.head.nil? 
    end
    item_count = @items.count { |x| x }
    puts "Load Factor: #{item_count.to_f / @items.size}"
  end
end
