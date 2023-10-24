# frozen_string_literal: true

require_relative "src/doubly_linked_list"

class OptimizedLRUCache
  def initialize(capacity = 100)
    @capacity = capacity
    @cache = {}
    @queue = DoublyLinkedList.new(capacity)
  end

  def get(element)
    node = @cache[element]
    if node
      make_element_the_newest(node)
      return node.value
    end

    insert_new_element(element)
    @cache[element].value
  end

  def items
    @queue.items
  end

  private

  def make_element_the_newest(node)
    @queue.delete(node)
    @queue.insert(node.value)
  end

  def insert_new_element(element)
    node = @queue.insert(element)
    @cache[element] = node
    remove_oldest_element if size > @capacity
  end

  def remove_oldest_element
    removed_element = @queue.remove_tail
    @cache.delete(removed_element.value)
  end

  def size
    @cache.keys.size
  end
end
