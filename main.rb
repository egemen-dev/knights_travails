require_relative './lib/tree'

# Finds all 8 of the direction that a knight can move to.
# I just didn't want to hard code those coordinates and made a function it.
def all_directions(possibilities = [], plus_minus = [-1, 1], l_shape = [2, 1])
  plus_minus.repeated_permutation(2) do |direction|
    l_shape.permutation(2) do |shape|
      x = shape[0] * direction[0]
      y = shape[1] * direction[1]
      possibilities << [x, y]
    end
  end
  possibilities
end

def stay_inside?(x, y)
  (x > -1 && x < 8) && (y > -1 && y < 8)
end

# Breadth First Search
def explore_nodes(current, list)
  all_directions.each do |move|
    x = move[0] += current.value[0]
    y = move[1] += current.value[1]
    if stay_inside?(x, y) && !list.contains?([x, y])
      new_node = list.append([x, y])
      new_node.parent = current
      new_node.distance = current.distance + 1
    end
  end
  list
end

def retrace_parents(node, path = [])
  current = node
  path << current.value
  until current.parent.nil?
    current = current.parent
    path << current.value
  end
  puts "▸ You made it in #{node.distance} moves!"
  puts "▸ Here is your path: #{path.reverse}"
end

def knight_moves(current, target, list = nil)
  # Creates the Tree only once, and avoids creating it multiple times.
  if list.nil?
    list = Tree.new(current)
    current = list.head
  end

  visited_nodes = explore_nodes(current, list)

  if visited_nodes.contains?(target)
    found = visited_nodes.find(target)
    retrace_parents(found)
  else
    current = current.next
    knight_moves(current, target, list)
  end
end

knight_moves([0,0], [7,7])
