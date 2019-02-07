def binary_search(collection, value, low, high)
  if low > high
    return nil
  end
  mid = (high + low) / 2
  if collection[mid] > value
    binary_search(collection, value, low, mid - 1)
  elsif collection[mid] < value
    binary_search(collection, value, mid + 1, high)
  else
    return mid
  end
end

collection = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
puts binary_search(collection, 0, 0, 10)
puts binary_search(collection, 10, 0, 10)
puts binary_search(collection, 5, 0, 10)
puts binary_search(collection, 7, 0, 10)
puts binary_search(collection, 11, 0, 10)
