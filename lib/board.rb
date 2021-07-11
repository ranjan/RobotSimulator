# frozen_string_literal: true

class Board
  attr_reader :rows, :columns

  def initialize(rows, columns)
    unless rows.is_a?(Integer) && columns.is_a?(Integer)
      raise TypeError,
            'Invalid rows or columns type. It should be integer.'
    end

    @rows = rows
    @columns = columns
  end
end
