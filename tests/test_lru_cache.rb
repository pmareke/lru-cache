# frozen_string_literal: true

require_relative "../lru_cache"

class TestDoubleLinkedList < Minitest::Test
  def test_add_elements_to_the_cache_if_not_exist
    lru_cache = LRUCache.new

    assert_equal [], lru_cache.items

    lru_cache.get(1)

    assert_equal [1], lru_cache.items
  end

  def test_does_not_add_duplicate_element_to_the_cache
    lru_cache = LRUCache.new

    lru_cache.get(1)
    lru_cache.get(1)

    assert_equal [1], lru_cache.items
  end

  def test_cache_has_a_limit_capacity
    lru_cache = LRUCache.new(3)

    lru_cache.get(1)
    lru_cache.get(2)
    lru_cache.get(3)
    lru_cache.get(4)

    assert_equal [4, 3, 2], lru_cache.items
  end

  def test_latest_when_new_elements_arrive
    lru_cache = LRUCache.new(4)

    lru_cache.get(1)
    lru_cache.get(2)
    lru_cache.get(3)
    lru_cache.get(1)
    lru_cache.get(4)
    lru_cache.get(5)

    assert_equal [5, 4, 1, 3], lru_cache.items
  end
end
