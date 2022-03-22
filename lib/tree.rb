require_relative 'node'

class Tree
  attr_accessor :head

  def initialize(value)
    @head = Node.new(value)
  end

  # Returns the total number of nodes in the list.
  def size
    i = 1
    current = head
    until current.next.nil?
      current = current.next
      i += 1
    end
    i
  end

  # Returns the last node in the list.
  def tail
    i = 1
    current = head
    until current.next.nil?
      current = current.next
      i += 1
    end
    current
  end

  # Represents the #each method but it works with linked list, not arrays.
  def linked_list_each
    current = head
    until current.next.nil?
      yield(current) if block_given?
      current = current.next
      yield(current)
    end
  end

  # Appends a new node to the end of the list.
  def append(value)
    tail.next = Node.new(value)
  end

  # Returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    current = head
    return true if value == current.value

    while !current.next.nil? && current = current.next
      return true if value == current.value
    end
    false
  end

  # Returns the node, or nil if not found.
  def find(value)
    current = head
    return current if value == current.value

    while !current.next.nil? && current = current.next
      return current if value == current.value
    end
    nil
  end
end
