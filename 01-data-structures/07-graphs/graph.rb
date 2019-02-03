require_relative 'node'

class Graph
  def initialize(goal)
    @goal = goal
  end

  def find_kevin_bacon(start)
    visited_actors = []
    visited_films = []
    queue = []
    queue.push(start)

    until queue.empty?
      current_actor = queue.shift

      if current_actor == @goal
        return film_path(current_actor)
      end

      current_actor.film_actor_hash.each do |film, actors|
       next if visited_films.include?(film)
       actors.each do |actor|
         next if visited_actors.include?(actor) || queue.include?(actor)

         queue.push(actor)
         actor.parent_node = current_actor
         actor.parent_film = film
       end
       visited_films.push(film)
      end
      visited_actors.push(current_actor)
    end
    return "Could not find Kevin Bacon"
  end

  private
  def film_path(actor)
    result = []
    current_actor = actor

    until current_actor.parent_node.nil?
      result.unshift(current_actor.parent_film)
      old_actor = current_actor
      current_actor = old_actor.parent_node
      old_actor.remove_reference_nodes
    end
    result
  end
end
