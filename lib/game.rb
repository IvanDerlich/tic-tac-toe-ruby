require_relative 'board.rb'
require_relative 'validations.rb'
require_relative 'player.rb'
require_relative '../graphics/errors.rb'
require_relative '../graphics/interface.rb'


class Game

    def initialize        
        @board = Board.new  
        @player1 = Player.new('x', 1)
        @player2 = Player.new('o', 2)
        @validate = Validations.new 
        @error = Errors.new
        @interface = Interface.new
    end     

    def play()
        @interface.welcome
        symbol1 = @player1.symbol
        symbol2 = @player2.symbol
        move(symbol1)        
        move(symbol2)
        move(symbol1)
        move(symbol2) 
        move(symbol1)
        move(symbol2) 
        move(symbol1)  
        move(symbol2) 
        move(symbol1)        
        @interface.stalemate(@board)
    end 

    def move(symbol)   

        symbol_error = @validate.Symbol(symbol)
        return symbol_error  if symbol_error  < 0        

        validMoveFlag = false
        
        while(validMoveFlag == false)

            @interface.ask_input(@board,symbol)

            error_nr = validatePosition(position,@board) !=0

            if(error_nr != 0 )
                @error.handling(error_nr)
            else
                winner = @board.tic(position,symbol) 
                @interface.victory(@board,victor) if winner == @player1.number || winner == player2.number
                validMoveFlag = true
            end             
        end

    end

end
