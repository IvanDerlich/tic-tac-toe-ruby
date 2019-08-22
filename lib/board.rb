class Board

    attr_reader :state

    def initialize
        @state = ["", 1, 2, 3, 4, 5, 6, 7, 8, 9]
    end    

    def tic(position,symbol)
        @state[position.to_i] = symbol         
        return true if check(1,5,9) || check(7,5,3) || check(7,8,9) || check(4,5,6) || check(1,2,3) || check(7,4,1) || check(8,5,2)  || check(9,6,3) 
    end  

    private
    
    def check(pos1,pos2,pos3)
        return true if @state[pos1] ==  @state[pos2] &&  @state[pos2]  == @state[pos3]              
    end

end