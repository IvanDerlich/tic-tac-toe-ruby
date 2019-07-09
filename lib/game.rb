require_relative 'board.rb'
require_relative 'player.rb'
require_relative '../graphics/interface.rb'


class Game

    def initialize        
        @board = Board.new  
        @player1 = Player.new('x', 1)
        @player2 = Player.new('o', 2)
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
        exit
    end 

    private

    def move(symbol)  
        position = @interface.ask_input(@board,symbol)
        winner_symbol = @board.tic(position,symbol) 
        if winner_symbol
            winner_number = winner_number(winner_symbol) 
            @interface.victory(@board,winner_number) 
            exit
        end                   
    end

    def winner_number(winner_symbol)
        if winner_symbol == @player1.symbol || winner_symbol == @player2.symbol
            if @player1.symbol == winner_symbol
                winner_number = @player1.number 
            elsif @player2.symbol == winner_symbol
                winner_number = @player2.number 
            else
                puts "Never should have reached this line of code"
                exit
            end   
        end
    end

end
