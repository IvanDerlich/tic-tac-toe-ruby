class Validations
    def Symbol(symbol)
        return -2 if symbol != "x" && symbol != "o"                 
        0
    end
    def Position(position,board)
        return 20 unless position.is_a? Integer       
        return 21 if position > 9        
        return 22 if position < 1
        return 23 if board.get(position) == 'x' || board.get(position) == 'o'
        return 24 if position.nil?
        0   
    end
end