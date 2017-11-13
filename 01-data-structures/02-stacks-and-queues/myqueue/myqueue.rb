class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @head = element if empty?
    last_index = @queue.length
    @queue[last_index] = element
    @tail = element
  end

  def dequeue
    item = @queue.delete_at(0)
    @head = @queue[0]
    @tail = @queue.last
    item
  end

  def empty?
    @head.nil?
  end
end
