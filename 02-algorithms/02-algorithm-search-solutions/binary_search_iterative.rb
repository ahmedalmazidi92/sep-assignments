def binary_search(collection, value)
  low = 0
  high = collection.length - 1
  while low <= high
    mid = (low + high) / 2
    if collection[mid] > value
      high = mid - 1
    elsif collection[mid] < value
      low = mid + 1
    else
      return mid
    end
  end
  return nil
end


collection = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
puts binary_search(collection, 0)
puts binary_search(collection, 10)
puts binary_search(collection, 5)
puts binary_search(collection, 7)
puts binary_search(collection, 11)
