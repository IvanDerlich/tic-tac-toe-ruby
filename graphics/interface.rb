require_relative '../lib/validations'

class Interface
    def initialize
         @validations = Validations.new
         @errors = Errors.new
    end        

    def show(board)
        puts ""
        puts " #{board.state[1]} | #{board.state[2]} | #{board.state[3]} "
        puts "---|---|---"
        puts " #{board.state[4]} | #{board.state[5]} | #{board.state[6]} "
        puts "---|---|---"      
        puts " #{board.state[7]} | #{board.state[8]} | #{board.state[9]} "
    end

    def ask_input(board,symbol)        
        valid_position = false
        while valid_position == false
            show(board)
            puts "#{symbol}'s turn..."   
            position = gets.chomp.to_i            
            valid_position = @validations.inputed_position(position)                          
        end  
        inputed_position
    end

    def welcome
        puts "---Welcome to Tic Tac Toe---"
        puts "---Made by Ivan Derlich---"
        puts "---Check: ivanderlich.com---"
    end

    def victory(board,winner)
        show(board)
        puts "\n----Player #{winner} wins----" 
        puts "\n----The game ends----"         
    end

    def stalemate(board)
        show(board)
        puts "\nIt's a stalemate" 
        puts "\n----The game ends----" 
        
    end
end