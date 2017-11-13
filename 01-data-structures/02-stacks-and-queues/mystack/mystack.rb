class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @top = item
    top_of_stack = @stack.length
    @stack[top_of_stack] = item
  end

  def pop
    item = @stack.delete_at(@stack.length - 1)
    @top = @stack.last
    item
  end

  def empty?
    @top.nil?
  end
end
