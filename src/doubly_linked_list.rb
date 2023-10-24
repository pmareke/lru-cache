# frozen_string_literal: true

require_relative "node"

class DoublyLinkedList
  attr_reader :head, :tail

  def initialize(capacity)
    @capacity = capacity
    @head = nil
    @tail = nil
  end

  def remove_tail
    node = @tail
    @tail = @tail.previous
    @tail.next = nil if @tail
    node
  end

  def insert(value)
    node = Node.new(value)
    if @head.nil?
      @head = @tail = node
      return node
    end

    @head.previous = node
    node.next = @head
    @head = node
    node
  end

  def delete(node)
    if @tail == node
      @tail = node.previous
      node.next.previous = @tail.next if node.next

      return unless @head == node

      @head = node.next
      node.next.previuos = nil if node.next
    end

    previous_node = node.previous
    next_node = node.next
    previous_node.next = next_node unless previous_node.nil?
    next_node.previous = previous_node unless next_node.nil?
  end

  def items
    node = @head
    items = []
    until node.nil?
      items << node.value
      node = node.next
    end
    items
  end
end
