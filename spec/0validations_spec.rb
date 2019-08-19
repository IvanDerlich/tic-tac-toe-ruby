require './lib/validations.rb'

#for some reason if I don't prepend 0 to this filename, the tests won't run

context "validations" do
    let(:validation){Validations.new}
    describe "symbol" do
        it "returns false if symbol is correct" do
            expect(validation.symbol("x")).to be_nil
            expect(validation.symbol("o")).to be_nil            
        end 
        it "returns -2 if symbol is incorrect" do
            expect(validation.symbol("2")).to eql(-2)   
            expect(validation.symbol(1)).to eql(-2)   
            expect(validation.symbol(2.3)).to eql(-2)   
            expect(validation.symbol("asdf")).to eql(-2)   
        end 
    end

    describe "inputed_position" do
        it "returns 21 if position is greater than 9" do
            expect(validation.inputed_position(10)).to eql(21)
            expect(validation.inputed_position(12)).to eql(21)
            expect(validation.inputed_position(33)).to eql(21)
        end 

        it "returns 22 if position is smaller than 1" do
            expect(validation.inputed_position(0)).to eql(22)
            expect(validation.inputed_position(-1)).to eql(22)
            expect(validation.inputed_position(-2)).to eql(22)
        end
    end

    describe "free_position" do

        it "return 33 if position is already taken" do
            expect(validation.free_position("x")).to eql(33)
            expect(validation.free_position("o")).to eql(33)
        end 

        it "returns nil if position its free" do          
            expect(validation.free_position(1)).to be_nil
            expect(validation.free_position(2)).to be_nil
            expect(validation.free_position(3)).to be_nil
            expect(validation.free_position(9)).to be_nil
        end 
    end


    describe "valid_position" do
        xit "" do
        end 
    end
end
