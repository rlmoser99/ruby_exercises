# frozen_string_literal: true

# Chess board game
class Board
  def create_children(parent)
    # puts 'CREATE_CHILDREN'
    # puts "parent is #{parent} at #{parent.location}"
    parent.moves.each do |move|
      # puts "parent.move is #{move}"
      child = find_child(move).nil? ? Knight.new(move) : find_child(move)
      parent.children << child
    end
  end

  def create_family_tree(destination, queue = [@alpha], index = 0)
    # puts "CREATE_FAMILY_TREE destination: #{destination}"
    current = queue[index]
    # puts "current is #{current} at #{current.location}"
    create_children(current)
    current.children.each do |child|
      next if queue.include?(child)

      # puts "queue did not include child at #{child.location}"
      queue << child
    end

    return if current == find_child(destination)
    return if index >= 66

    index += 1
    create_family_tree(destination, queue, index)
  end

  def find_child(coordinates, queue = [@alpha], index = 0)
    found_knight = nil
    current = queue[index]
    return if current.nil?

    current.children.each do |child|
      queue << child unless queue.include?(child)
      found_knight = child if child.location == coordinates
    end
    index += 1
    return found_knight unless found_knight.nil?

    find_child(coordinates, queue, index)
  end

  def knight_moves(start, destination)
    # puts "start is #{start} & destination is #{destination}"
    @alpha = Knight.new(start)
    create_family_tree(destination)
    # knight_list
  end

  private

  def knight_list
    puts 'LIST OF ALL THE KNIGHTS:'
    knight_summary = board_locations
    knight_summary.each do |knight|
      current = find_child(knight)
      puts "Location: #{knight}"
      puts "Current #{current} at #{current.location}" unless current.nil?
      puts ''
    end
  end

  def board_locations
    [0, 1, 2, 3, 4, 5, 6, 7].repeated_permutation(2).to_a
  end
end
