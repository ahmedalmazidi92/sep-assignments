require 'benchmark'
require_relative 'binary_tree/binary_search_tree'
require_relative 'min_binary_heap/min_binary_heap'

root = Node.new("1", 1)
bs_tree = BinarySearchTree.new(root)
mb_heap = MinBinaryHeap.new(root)
array = (2..10000).to_a.shuffle

Benchmark.bm do |x|
  x.report("BST Insert") {array.each do |i|
    bs_tree.insert(root, Node.new("#{i}", i))
  end}
  x.report("MBH Insert") {array.each do |i|
    mb_heap.insert(root, Node.new("#{i}", i))
  end}
  x.report("BST Find") {bs_tree.find(root, "5000")}
  x.report("MBH Find") {mb_heap.find(root, "5000")}
  x.report("BST Delete") {array.each do |i|
    bs_tree.delete(root, "#{i}")
  end}
  x.report("MBH Delete") {array.each do |i|
    mb_heap.delete(root, "#{i}")
  end}
end
