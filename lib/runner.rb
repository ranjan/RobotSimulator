# frozen_string_literal: true

require_relative './robot'

r = Robot.new
$stdin.each_line do |line|
  r.execute(Command.parse_from_string(line.chomp))
end
