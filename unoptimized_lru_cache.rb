# frozen_string_literal: true

class UnoptimizedLRUCache
  def initialize(capacity = 100)
    @capacity = capacity
    @cache = {}
    @queue = []
  end

  def get(value)
    cached_value = @cache[value]
    if cached_value
      make_element_the_newest(value)
      return value
    end

    insert_new_element(value)
    @cache[value]
  end

  def items
    @queue
  end

  private

  def make_element_the_newest(value)
    @queue.delete(value)
    @queue.unshift(value)
  end

  def insert_new_element(value)
    @queue.unshift(value)
    @cache[value] = value
    remove_oldest_element if size > @capacity
  end

  def remove_oldest_element
    removed_value = @queue.pop
    @cache.delete(removed_value)
  end

  def size
    @cache.keys.size
  end
end
