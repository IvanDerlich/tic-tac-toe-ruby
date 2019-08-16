require './lib/game.rb'

describe "play" do

    let(:game){Game.new}

    it "Player one wins" do
        allow(game.interface).to receive(:gets).and_return("1","2","5","8","9")
        expect(game.play()).to eql(1)
    end    

    it "Player two wins" do
        allow(game.interface).to receive(:gets).and_return("2","1","8","5","7","9")
        expect(game.play()).to eql(2)
    end 

    it "Stalemate" do
        allow(game.interface).to receive(:gets).and_return("1","2","3","5","4","6","8","7","9")
        expect(game.play()).to eql(0)
    end     
end

describe "move" do
    let(:game){Game.new()}
    it "Player one wins" do
        game.board.instance_variable_set(:@state, ["", "x", 2, 3, 4, "x", 6, 7, 8, 9])
        allow(game.interface).to receive(:gets).and_return("9")
        expect(game.move("x")).to eql("x")
    end 

    it "Player two wins" do
        game.board.instance_variable_set(:@state, ["", "o", 2, 3, 4, "o", 6, 7, 8, 9])
        allow(game.interface).to receive(:gets).and_return("9")
        expect(game.move("o")).to eql("o")
        move()
    end 

    xit "returns nil" do
    end 

    xit "returns specific board state 1" do
    end 

    xit "returns specific board state 2" do
    end 

    xit "returns specific board state 3" do
    end 
end

describe "winner_number" do
    xit "" do
    end 
end

# describe "test" do
#     let(:game){ Game.new}
#     it "returns the input data" do
#         allow(game).to receive(:gets).and_return('Hola')
#         expect(game.test).to eql("Hola")
#     end
# end