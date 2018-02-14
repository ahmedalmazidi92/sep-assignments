class Node
  attr_accessor :title
  attr_accessor :rating

  def initialize(title, rating)
    @title, @rating = title, rating
  end
end
