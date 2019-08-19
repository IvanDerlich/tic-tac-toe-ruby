require './lib/player.rb'

describe "Symbol" do
    it "symbol should be x" do
        expect(Player.new("x",1).symbol).to eql("x")
    end

    it "symbol should be o" do
        expect(Player.new("o",2).symbol).to eql("o")
    end

    it "Return error on invalid symbols" do
        expect(Player.new("t",1).symbol).to be_false
        expect(Player.new("y",2).symbol).to be_false
        expect(Player.new(5,1).symbol).to be_false
        expect(Player.new("j",2).symbol).to be_false
    end

    it "Number should be 1 when symbol is x" do
        expect(Player.new("x",1).numer).to eql(1)
    end

    it "Number should be 2 when symbol is o" do
        expect(Player.new("o",2).numer).to eql(2)
    end

    xit "Number should be 2 when symbol is x" do
    end
end