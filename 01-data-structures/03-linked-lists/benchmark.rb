require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

arr = Array.new
llist = LinkedList.new
nodes = Array.new

10000.times do
  nodes.push(Node.new(rand))
end
node_5000 = nodes[5001]

Benchmark.bm do |x|
  # Compare the time it takes to create a 10,000 item Array to appending 10,000 items to a Linked List.
  x.report("Array items") {nodes.each do |node|
    arr.push(node)
  end }

  x.report("LinkedList items") { nodes.each do |node|
    llist.add_to_tail(node)
  end }

  # Compare the time it takes to access the 5000th element of the Array and the 5000th Node in the Linked List.
  x.report("Array retrieval") { arr[5001] }

  x.report("LinkedList retrieval") { llist.search(node_5000) }

  # Compare the time it takes to remove the 5000th element from the Array to removing the 5000th Node in the Linked List.
  x.report("Array deleting") { arr.delete_at(5001) }

  x.report("LinkedList deleting") { llist.delete(node_5000) }
end
