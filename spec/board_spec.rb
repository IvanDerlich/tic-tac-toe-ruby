require './lib/board.rb'

describe "tic" do
    let(:board){Board.new()}

    it "tic 1, tic 5, tic 9 should return true" do      
        board.tic(1,"x")  
        board.tic(5,"x")  
        expect(board.tic(9,"x")).to be
    end

    it "tic 5, tic 1, tic 9 should return true" do      
        board.tic(5,"x")  
        board.tic(1,"x")  
        expect(board.tic(9,"x")).to be
    end

    it "tic 9, tic 1, tic 5 should return true" do      
        board.tic(9,"x")  
        board.tic(1,"x")  
        expect(board.tic(5,"x")).to be
    end


    it "tic 7, tic 5, tic 3 should return true" do
        board.tic(7,"x")  
        board.tic(5,"x")  
        expect(board.tic(3,"x")).to be
    end  

    it "tic 7, tic 8, tic 9 should return true" do 
        board.tic(7,"x")  
        board.tic(8,"x")  
        expect(board.tic(9,"x")).to be
    end

    it "tic 4, tic 5, tic 6 should return true" do 
        board.tic(4,"x")  
        board.tic(5,"x")  
        expect(board.tic(6,"x")).to be
    end
    
    it "tic 1, tic 2, tic 3 should return true" do 
        board.tic(1,"x")  
        board.tic(2,"x")  
        expect(board.tic(3,"x")).to be
    end
    
    it "tic 7, tic 4, tic 1 should return true" do 
        board.tic(7,"x")  
        board.tic(4,"x")  
        expect(board.tic(1,"x")).to be
    end
    
    it "tic 8, tic 5, tic 2 should return true" do 
        board.tic(8,"x")  
        board.tic(5,"x")  
        expect(board.tic(2,"x")).to be
    end
    
    it "tic 9, tic 6, tic 3 should return true" do         
        board.tic(9,"x")  
        board.tic(6,"x")  
        expect(board.tic(3,"x")).to be
    end 

    it "tic 9, tic 6, tic 3 should return true" do 
        board.tic(9,"x")  
        board.tic(6,"x")  
        expect(board.tic(3,"x")).to be
    end 

    it "tic 9, tic 6 should return nil" do 
        board.tic(9,"x")   
        expect(board.tic(6,"x")).to be_nil
    end 

    it "tic 9, tic 1 should return nil" do 
        board.tic(9,"x")   
        expect(board.tic(1,"x")).to be_nil
    end

    context "When multiple tics with different endings" do
        let(:board){Board.new}

        it "stalemate" do
            board.tic(5,"x")
            board.tic(6,"o")
            board.tic(2,"x")
            board.tic(8,"o")            
            expect(board.tic(9,"x")).to be_nil
        end

        it "tests_state" do
            board.tic(3,"x")
            board.tic(7,"o")
            board.tic(5,"x")            
            expect(board.state).to eql(["", 1, 2, "x", 4, "x", 6, "o", 8, 9])
        end

        it "tests_state" do
            board.tic(5,"x")
            board.tic(1,"o")
            board.tic(3,"x")
            board.tic(7,"o")
            expect(board.state).to eql(["", "o", 2, "x", 4, "x", 6, "o", 8, 9])
        end


        it "Player one wins" do
            board.tic(9,"x")
            board.tic(2,"o")
            board.tic(6,"x")
            expect(board.state).to eql(["", 1, "o", 3, 4, 5, "x", 7, 8, "x"])
        end

        it "Player two wins" do
            board.tic(9,"x") 
            board.tic(4,"x")
            expect(board.state).to eql(["", 1, 2, 3, "x", 5, 6, 7, 8, "x"])
        end
    end

end