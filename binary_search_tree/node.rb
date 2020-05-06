# frozen_string_literal: true

class Node
  attr_accessor :data, :left, :right

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  def to_s
    @data.to_s
  end
end
