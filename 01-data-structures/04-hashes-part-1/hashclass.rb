require_relative 'hash_item'
class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    index = index(key, self.size)
    if !@items[index].nil? && @items[index].key != key
      resize
      index = index(key, self.size)
    end
    puts "Index: #{index}"
    puts "Key: #{key}"
    @items[index] = HashItem.new(key, value)
  end


  def [](key)
    new_index = index(key, self.size)
    @items[new_index].value if @items[new_index]
  end

  def resize
    new_array = Array.new(self.size * 2)
    @items.each do |item|
      if !item.nil?
        new_index = index(item.key, new_array.size)
        new_array[new_index] = item
      end
    end
    @items = new_array
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    ascii_value = key.sum
    ascii_value % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

end
