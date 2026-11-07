class LinkedList
  attr_reader :list
  @@size = 0
  def initialize(value = nil)
    @list = Node.new(value)
    @tail = @list
  end

  def append(value)
    @list = Node.new(value) unless @list
    @tail.next_node = Node.new(value)
    @tail = @tail.next_node
    @@size += 1
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @list
    @list = new_node
    @@size -= 1
    @@size = 1 if @@size < 0
  end

  def size
    @@size
  end

  def head
    return nil unless @list
    @list.value
  end

  def tail
    return nil unless @tail
    @tail.value
  end

  def at(index)
    current = @list
    count = 0
    until count == index
      current = current.next_node
      return nil unless current
      count += 1
    end

    current.value
  end

  def pop
    return nil unless @list
    value = @list.value
    @list = @list.next_node
    value
  end

  def contains?(value)
    current = @list
    until current == nil
      return true if current.value == value
      current = current.next_node
    end
    false
  end

  def index(value)
    count = 0
    current = @list
    until current == nil
      return count if current.value == value
      current = current.next_node
      count += 1
    end
    nil
  end

  def to_s
    current = @list
    string = ''
    until current == nil
      string += "( #{current.value} ) -> "
      current = current.next_node
    end
    string += 'nil'
  end
end

class Node
  attr_accessor :value, :next_node
  def initialize(value, next_node = nil) 
    @value = value
    @next_node = next_node
  end
end