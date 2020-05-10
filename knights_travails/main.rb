# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'knight.rb'

knight = Knight.new([0, 0])
puts "Starting Location: #{knight.location}"
puts "knight's children: #{knight.children}"
