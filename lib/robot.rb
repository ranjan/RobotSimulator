# frozen_string_literal: true

require_relative('board')
require_relative('command')

class Robot
  attr_accessor :x, :y, :direction, :board

  DIRECTIONS = %i[NORTH EAST SOUTH WEST].freeze

  def place(x, y, direction)
    return unless DIRECTIONS.include?(direction)

    board = Board.new 5, 5
    return unless x.between?(0, board.rows - 1) && y.between?(0, board.columns - 1)

    @x = x
    @y = y
    @direction = direction
    @board = board
  end

  def move_forward
    return unless is_placed

    pos_x = @x
    pos_y = @y
    case @direction
    when :EAST
      pos_x = @x + 1
    when :WEST
      pos_x = @x - 1
    when :NORTH
      pos_y = @y + 1
    when :SOUTH
      pos_y = @y - 1
    end
    if valid_position?(pos_x, pos_y)
      @x = pos_x
      @y = pos_y
    end
  end

  def rotate_right
    current_dir_index = DIRECTIONS.index(@direction)
    new_index = if current_dir_index + 1 == DIRECTIONS.length
                  0
                else
                  current_dir_index + 1
                end
    @direction = DIRECTIONS[new_index]
  end

  def rotate_left
    current_dir_index = DIRECTIONS.index(@direction)
    new_index = if current_dir_index.zero?
                  DIRECTIONS.length - 1
                else
                  current_dir_index - 1
                end
    @direction = DIRECTIONS[new_index]
  end

  def valid_position?(x, y)
    (x >= 0 && x < board.columns && y >= 0 && y < board.rows)
  end

  def print_report
    str = "#{@x},#{@y},#{@direction}"
    puts str
    str
  end

  def execute(command)
    case command
    when CommandPlace
      place(command.x, command.y, command.direction)
    when :MOVE
      move_forward
    when :LEFT
      rotate_left
    when :RIGHT
      rotate_right
    when :REPORT
      print_report
    end
  end

  def is_placed
    !@board.nil?
  end
end
