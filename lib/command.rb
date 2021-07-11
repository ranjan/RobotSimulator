# frozen_string_literal: true

class Command
  def self.parse_from_string(input)
    args = input.split(/\s+/)
    command = args.first.to_s.downcase.to_sym

    case command
    when :place
      arguments = args.last
      place = arguments.split(/,/)
      x = place[0].to_i
      y = place[1].to_i
      direction = place[2].to_sym
      CommandPlace.new(x, y, direction)
    else
      input.to_sym
    end
  end
end

class CommandPlace < Command
  attr_accessor :x, :y, :direction

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end
end
