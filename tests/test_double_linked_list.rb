# frozen_string_literal: true

require_relative "../src/double_linked_list"
require "minitest/autorun"

class TestDoubleLinkedList < Minitest::Test
  def setup
    @list = DoubleLinkedList.new(3)
  end

  def test_create_an_empty_linked_list
    assert_nil @list.head
    assert_nil @list.tail
  end

  def test_add_element_at_the_head
    node = @list.insert(1)

    assert_equal node, @list.head
    assert_nil @list.head.previous
    assert_nil @list.head.next
  end

  def test_remove_element_at_the_tail
    @list.insert(1)
    node = @list.insert(2)
    @list.remove_tail

    assert_equal node, @list.tail
  end

  def test_delete_first_element
    node_one = @list.insert(1)
    node_two = @list.insert(2)
    node_three = @list.insert(3)

    @list.delete(node_one)

    assert_equal node_three, @list.head
    assert_equal node_two, @list.tail
  end

  def test_delete_in_the_middle_element
    node_one = @list.insert(1)
    node_two = @list.insert(2)
    node_three = @list.insert(3)

    @list.delete(node_two)

    assert_equal node_three, @list.head
    assert_equal node_one, @list.tail
  end

  def test_delete_last_element
    node_one = @list.insert(1)
    node_two = @list.insert(2)
    node_three = @list.insert(3)

    @list.delete(node_one)

    assert_equal node_three, @list.head
    assert_equal node_two, @list.tail
  end
end
