class Node
  attr_accessor :value, :next, :distance, :parent

  def initialize(value)
    @value = value
    @parent = nil
    @next = nil
    @distance = 0
  end
end
