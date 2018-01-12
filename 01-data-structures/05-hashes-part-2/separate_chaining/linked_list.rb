require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head && @tail
      @tail.next = node
      @tail = node
    else
      @head = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head == @tail
      @head = nil
      @tail = nil
    else
      current_node = @head
      until current_node.next == @tail
        current_node = current_node.next
      end
      @tail = current_node
      @tail.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    output = ""
    current_node = @head
    node_count = 1
    until current_node.nil?
      output += "Node #{node_count} - Key: #{current_node.key}, Value: #{current_node.value}, "
      current_node = current_node.next
      node_count+= 1
    end
    output
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if node == @head
      remove_front
    elsif node == @tail
      remove_tail
    else
      current_node = @head
      until current_node.next == node
        current_node = current_node.next
      end
      current_node.next = node.next
      node.next = nil
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = @head
    @head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    current_node = @head
    @head = current_node.next
    current_node.next = nil
    current_node
  end
end
