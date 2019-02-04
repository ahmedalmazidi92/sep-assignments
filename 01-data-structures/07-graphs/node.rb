class Node
  attr_accessor :name
  attr_accessor :film_actor_hash
  attr_accessor :parent_node
  attr_accessor :parent_film

  def initialize(name)
    @name = name
    @film_actor_hash = Hash.new
  end

  def add_film(film_name, cast)
    @film_actor_hash["#{film_name}"] = cast
    cast.each do |actor|
      actor.film_actor_hash["#{film_name}"] = cast - [actor] + [self]
    end
  end

  def remove_reference_nodes
    @parent_node = nil
    @parent_movie = nil
  end
end
