# frozen_string_literal: true

require_relative "../unoptimized_lru_cache"

class TestUnoptimizedLRUCache < Minitest::Test
  def test_add_elements_to_the_cache_if_not_exist
    cache = UnoptimizedLRUCache.new

    assert_equal [], cache.items

    cache.get(1)

    assert_equal [1], cache.items
  end

  def test_does_not_add_duplicate_element_to_the_cache
    cache = UnoptimizedLRUCache.new

    cache.get(1)
    cache.get(1)

    assert_equal [1], cache.items
  end

  def test_cache_has_a_limit_capacity
    cache = UnoptimizedLRUCache.new(3)

    cache.get(1)
    cache.get(2)
    cache.get(3)
    cache.get(4)

    assert_equal [4, 3, 2], cache.items
  end

  def test_latest_when_new_elements_arrive
    cache = UnoptimizedLRUCache.new(4)

    cache.get(1)
    cache.get(2)
    cache.get(3)
    cache.get(1)
    cache.get(4)
    cache.get(5)

    assert_equal [5, 4, 1, 3], cache.items
  end
end
