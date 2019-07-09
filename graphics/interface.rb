class Interface

    def show(board)
        puts ""
        puts " #{board.get(1)} | #{board.get(2)} | #{board.get(3)} "
        puts "---|---|---"
        puts " #{board.get(4)} | #{board.get(5)} | #{board.get(6)} "
        puts "---|---|---"      
        puts " #{board.get(7)} | #{board.get(8)} | #{board.get(9)} "
    end

    def ask_input(board,symbol)
        show(board)
        puts "#{symbol}'s turn..."           
        position = gets.chomp.to_i
    end

    def welcome
        p "---Welcome to Tic Tac Toe---"
    end

    def victory(board,winner)
        show(board)
        p "\n----Player #{winner} wins----" 
        p "\n----The game ends----" 
        exit
    end

    def stalemate(board)
        show(board)
        p "\nIt's a stalemate" 
        p "\n----The game ends----" 
        exit
    end
end