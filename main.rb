class Node
  attr_accessor :value, :next, :visited, :distance

  def initialize(value)
    @value = value
    @next = nil
    @visited = false
    @distance = 0
  end
end

class LinkedList
  attr_accessor :head

  def initialize(array)
    @head = Node.new(array[0])
    connect(array)
  end

  # Accepts an array and appends each value of array to the list.
  def connect(array)
    array.shift # This avoids duplication beacause first value is already a head in the list.
    append(array.shift) until array.empty?
  end

  # size returns the total number of nodes in the list.
  def size
    i = 1
    current = head
    while !current.next.nil?
      current = current.next
      i += 1
    end
    i
  end

  # tail returns the last node in the list.
  def tail
    i = 1
    current = head
    while !current.next.nil?
      current = current.next
      i += 1
    end
    tail = current
  end

  # linked_list_each represents the #each method but it works with linked list, not arrays.
  def linked_list_each(&block)
    current = head
    until current.next.nil?
      yield(current) if block_given?
      current = current.next
      yield(current)
    end
  end

  # append(value) adds a new node containing value to the end of the list.
  def append(value)
    tail.next = Node.new(value)
  end

  # prepend(value) adds a new node containing value to the start of the list.
  def prepend(value)
    old_head = head
    new_head = Node.new(value)
    @head = new_head
    new_head.next = old_head
  end

  # at(index) returns the node at the given index.
  def at(index)
    i = 0
    current = head
    while i < index && current = current.next
      i += 1
    end
    current
  end

  # shift removes the first element from the list.
  def shift
    new_head = head.next
    head.next = nil
    @head = new_head
  end

  # pop removes the last element from the list.
  def pop
    penultimate = size - 2
    new_tail = at(penultimate)
    new_tail.next = nil
  end

  # contains?(value) returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    current = head
    return true if value == current.value

    while !current.next.nil? && current = current.next
      return true if value == current.value
    end
    false
  end

  # find(value) returns the node, or nil if not found.
  def find(value)
    current = head
    return current if value == current.value

    while !current.next.nil? && current = current.next
      return current if value == current.value
    end
    nil
  end

  def node(current)
    "( #{current.value} ) -> "
  end

  def to_s
    current = head
    list = node(current)
    end_nil = 'nil'
    while !current.next.nil? && current = current.next
      list += node(current)
    end
    puts list + end_nil
  end
end

#--------------------------------------------------------------------------------

def all_the_ways(possibilities = [], directions = [-1, 1], l_shape = [2, 1])
  directions.repeated_permutation(2) do |direction|
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

def possible_moves(current, target, moves = [])
  all_the_ways.each do |move|
    x = move[0] += current[0]
    y = move[1] += current[1]
    moves << [x, y] if stay_inside?(x, y)
    puts 'target here' if target == [x, y]
  end
  p moves
  LinkedList.new(moves)
end

def queue_up(directions, distance, queue)
  directions.linked_list_each do |move|
    move.distance += distance
    queue << move unless move.visited
  end
end

def knight_moves(current, target, queue = [], distance = 1)
  directions = possible_moves(current, target)
  queue_up(directions, distance, queue)

  if directions.contains?(target)
    p directions.find(target)
  else
    distance += 1
    new_base = queue.shift.value
    knight_moves(new_base, target, queue, distance)
  end
end

knight_moves([0,0], [4,3])
