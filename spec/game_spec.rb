require './lib/game.rb'

context "declared game" do
    let(:game){Game.new}
    
    describe "play" do    

        it "Player one wins" do
            allow(game.send(:get_interface)).to receive(:gets).and_return("1","2","5","8","9")
            expect(game.play()).to eql(1)
        end    

        it "Player two wins" do
            allow(game.send(:get_interface)).to receive(:gets).and_return("2","1","8","5","7","9")
            expect(game.play()).to eql(2)
        end 

        it "Stalemate" do
            allow(game.send(:get_interface)).to receive(:gets).and_return("1","2","3","5","4","6","8","7","9")
            expect(game.play()).to eql(0)
        end     
    end

    describe "move" do
        it "Player one wins" do
            game.send(:get_board).instance_variable_set(:@state, ["", "x", 2, 3, 4, "x", 6, 7, 8, 9])
            allow(game.send(:get_interface)).to receive(:gets).and_return("9")
            expect(game.send(:move,"x")).to eql("x")
        end

        it "Player two wins" do
            game.send(:get_board).instance_variable_set(:@state, ["", "o", 2, 3, 4, "o", 6, 7, 8, 9])
            allow(game.send(:get_interface)).to receive(:gets).and_return("9")
            expect(game.send(:move,"o")).to eql("o")
        end 

        it "returns nil" do
            allow(game.send(:get_interface)).to receive(:gets).and_return("3")
            expect(game.send(:move,"o")).to eql(nil)
        end 

        it "returns specific board state 1" do
            game.send(:get_board).instance_variable_set(:@state, ["", 1, 2, 3, 4, 5, 6, 7, 8, 9])        
            allow(game.send(:get_interface)).to receive(:gets).and_return("3")
            game.send(:move,"o")
            expect(game.send(:get_board).state).to eql(["", 1, 2, "o", 4, 5, 6, 7, 8, 9])
        end 

        it "returns specific board state 2" do
            allow(game.send(:get_interface)).to receive(:gets).and_return("3","5")
            game.send(:move,"o")
            game.send(:move,"x")
            expect(game.send(:get_board).state).to eq(["", 1, 2, "o", 4, "x", 6, 7, 8, 9])
        end 

        it "returns specific board state 3" do
            allow(game.send(:get_interface)).to receive(:gets).and_return("3","5")
            game.send(:move,"x")
            game.send(:move,"o")
            expect(game.send(:get_board).state).to eq(["", 1, 2, "x", 4, "o", 6, 7, 8, 9])
        end 
    end

    describe "winner_number" do
        it "enters x receives 1" do
            expect(game.send(:winner_number,"x")).to eq(1)
        end 
        it "enters o receives 0" do
            expect(game.send(:winner_number,"o")).to eq(2)
        end 
    end
end