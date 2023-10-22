# frozen_string_literal: true

class Node
  attr_accessor :value, :previous, :next

  def initialize(value)
    @value = value
    @previous = nil
    @next = nil
  end
end
