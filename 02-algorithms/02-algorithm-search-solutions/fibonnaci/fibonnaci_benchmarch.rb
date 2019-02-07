require 'benchmark'
require_relative 'fibonnaci_iterative'
require_relative 'fibonnaci_recursive'

fib_it = FibonacciIterative.new
fib_recur = FibonnaciRecursive.new

Benchmark.bm do |x|
  x.report("Iterative") { fib_it.fib(20) }
  x.report("Recursive") { fib_recur.fib(20) }
end
