require_relative 'board.rb'
require_relative 'player.rb'
require_relative '../graphics/interface.rb'


class Game

    def initialize        
        @board = Board.new  
        @player1 = Player.new('x',1)
        @player2 = Player.new('o',2)
        @interface = Interface.new
        @moves = 0        
    end     

    def play()
        @interface.welcome
        symbol1 = @player1.symbol
        symbol2 = @player2.symbol
        winner_symbol = nil

        while true
            winner_symbol = move(symbol1)  
            break if @moves > 8 || winner_symbol
            winner_symbol = move(symbol2)  
            break if @moves > 8 || winner_symbol  
        end

        if winner_symbol
            winner_number = winner_number(winner_symbol)
            @interface.victory(@board,winner_number)                        
        else            
            @interface.stalemate(@board) 
        end 
    end   

    private

    def move(symbol)  
        position = @interface.ask_input(@board,symbol)
        winner_symbol = symbol if @board.tic(position,symbol)                         
        @moves += 1         
        winner_symbol
    end        

    def winner_number(winner_symbol)
        if winner_symbol == @player1.symbol || winner_symbol == @player2.symbol
            if @player1.symbol == winner_symbol
                winner_number = @player1.number 
            elsif @player2.symbol == winner_symbol
                winner_number = @player2.number            
            end   
        end
    end

    def get_interface
        @interface
    end

    def get_board
        @board
    end
    
end
