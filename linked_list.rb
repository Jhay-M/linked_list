class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def create_node(var)
    Node.new(var)
  end

  def append(value)
    res = create_node(value)
    @head.nil? ? @head = res : @tail.next = res
    @tail = res
  end

  def prepend(value)
    res = create_node(value)
    if @head.nil?
      @head = res
      @tail = res
    else
      res.next = @head
      @head = res
    end
  end

  def nodes
    return nil if @head.nil?

    entry = @head
    until entry.nil?
      yield entry
      entry = entry.next
    end
  end

  def size
    sum = 1
    nodes do
      sum += 1
    end
    sum
  end

  def at(idx)
    return nil if idx >= size

    current_idx = 0
    current = @head
    loop do
      break if current_idx == idx

      current = current.next
      current_idx += 1
    end
    current
  end

  def pop
    return nil if @head.nil?

    value = at(size - 3)
    @tail = value
    @tail.next = nil
    @head
  end

  def contains?(var)
    i = 0
    while i < size - 1
      current = at(i).value
      return true if current == var

      i += 1
    end
    false
  end

  def find(var)
    return nil unless contains?(var)

    i = 0
    while i < size
      return i if at(i).value == var

      i += 1
    end
  end

  def to_s
    i = 0
    while i < size
      print "nil\n" if i == size - 1
      print "( #{at(i).value} ) -> " if i < size - 1
      i += 1
    end
  end
end

class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

jhay = LinkedList.new
jhay.prepend('a')
jhay.append('b')
jhay.append('c')
jhay.append('d')
jhay.append('e')
jhay.append('f')

jhay.to_s
