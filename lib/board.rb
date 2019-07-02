class Board

    def initialize
        @state = ["", 1, 2, 3, 4, 5, 6, 7, 8, 9]        
    end    

    def tic(position,symbol)              
        @state[position.to_i] = symbol 
        
        #<comment>
        check = check(1,5,9)
        return check if check != 0
        check = check(7,5,3)
        return check if check != 0
        check = check(7,8,9)
        return check if check != 0
        check = check(4,5,6)
        return check if check != 0
        check = check(1,2,3)      
        return check if check != 0         
        check = check(7,4,1)
        return check if check != 0
        check = check(8,5,2)  
        return check if check != 0
        check = check(9,6,3) 
        return check if check != 0        
        #</comment> If you know how to do this better, please e-mail me at a@ivanderlich.com
        
        check
    end

    def get(position)
        @state[position]
    end

    private 

    def check(pos1,pos2,pos3)
        if @state[pos1] ==  @state[pos2] &&  @state[pos2] == @state[pos3]  
            return 1 if @state[pos2] == "x"
            return 2 if @state[pos2] == "o"
        end   
        0
    end
end