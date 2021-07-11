require "robot"

describe Robot do
  it "Test PLACE Command" do
    r=Robot.new
    r.execute(Command.parse_from_string('PLACE 0,1,WEST'))
    expect(r.x).to eq(0)
    expect(r.y).to eq(1)
    expect(r.direction).to eq(:WEST)
  end
  
  it "Test MOVE Command" do
    r=Robot.new
    r.execute(Command.parse_from_string('PLACE 1,1,NORTH'))
    r.execute(Command.parse_from_string('MOVE'))
    expect(r.x).to eq(1)
    expect(r.y).to eq(2)
    expect(r.direction).to eq(:NORTH)
  end

  it "TEST LEFT Command" do
    r=Robot.new
    r.execute(Command.parse_from_string('PLACE 0,0,NORTH'))
    expect(r.direction).to eq(:NORTH)
    r.execute(Command.parse_from_string('LEFT'))
    expect(r.direction).to eq(:WEST)
    r.execute(Command.parse_from_string('LEFT'))
    expect(r.direction).to eq(:SOUTH)
    r.execute(Command.parse_from_string('LEFT'))
    expect(r.direction).to eq(:EAST)
    r.execute(Command.parse_from_string('LEFT'))
    expect(r.direction).to eq(:NORTH)
  end
  
end
