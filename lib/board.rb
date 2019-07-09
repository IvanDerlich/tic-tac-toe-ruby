class Board

    attr_reader :state

    def initialize
        @state = ["", 1, 2, 3, 4, 5, 6, 7, 8, 9]        
    end    

    def tic(position,symbol)              
        @state[position.to_i] = symbol 
        
        check = check(1,5,9)
        return check if check
        check = check(7,5,3)
        return check if check
        check = check(7,8,9)
        return check if check
        check = check(4,5,6)
        return check if check
        check = check(1,2,3)      
        return check if check         
        check = check(7,4,1)
        return check if check
        check = check(8,5,2)  
        return check if check
        check = check(9,6,3) 
        return check if check        
    end  

    def check(pos1,pos2,pos3)
        return @state[pos1] if @state[pos1] ==  @state[pos2] &&  @state[pos2]  == @state[pos3]              
    end
end