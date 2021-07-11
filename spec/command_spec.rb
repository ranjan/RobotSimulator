require "command"

describe Command do
  describe "parse_from_string" do
    it "parses arguments" do
      expect(Command.parse_from_string('PLACE 0,2,WEST').direction).to eq(:WEST)
      expect(Command.parse_from_string('PLACE 1,2,NORTH').x).to eq(1)
      expect(Command.parse_from_string('PLACE 1,0,NORTH').y).to eq(0)
    end
  end
end
