require_relative '../lib/board.rb'

class Game

    def initialize
        @board = Board.new()        
        @moves = 0
    end  

    def show()
        puts ""
        puts " #{@board.get(1)} | #{@board.get(2)} | #{@board.get(3)} "
        puts "---|---|---"
        puts " #{@board.get(4)} | #{@board.get(5)} | #{@board.get(6)} "
        puts "---|---|---"      
        puts " #{@board.get(7)} | #{@board.get(8)} | #{@board.get(9)} "
    end
    
    def validatePosition(position)
        #7: non stopping error
        #0: everything OK
        unless position.is_a? Integer
            puts "Position is not an integer"
            return 7
        end
        if position > 9
            puts "Position is greater than 9"
            return 7
        end
        if position < 1
            puts "Position is lower than 1"
            return 7
        end
        if @board.get(position)== 'x' || @board.get(position) == 'o'
            puts "Position already taken"
            return 7
        end
        if position.nil?
            puts "Can't enter null position"
            return 7
        end
        0   
    end

    def validateSymbol(symbol)
        if symbol != "x" && symbol != "o"
            puts "Critical error: Symbol its not 'x' nor 'o'."
            puts "Program exists."
            exit
        end
        0
    end

    def play  
        move("x")        
        move("o")
        move("x")
        move("o") 
        move("x")
        move("o") 
        move("x")  
        move("o") 
        move("x")
        puts "\nIt's a stalemate" 
        puts "\n----The game ends----" 
        exit
    end 

    def move(symbol)        

        validateSymbol(symbol)

        validMoveFlag = false
        
        while(validMoveFlag == false)

            show

            puts "#{symbol}'s turn: select the position"            

            position = gets.chomp.to_i

            if(validatePosition(position) !=0 )
                puts "The same player keeps playing"
            else
                result = @board.tic(position,symbol) 
                victory(result) if result == 1 || result == 2
                validMoveFlag = true
            end             
        end

    end

    private

    def victory(result)
        show
        puts "\n----Player #{result} wins----" 
        puts "\n----The game ends----" 
        exit
    end   

end
