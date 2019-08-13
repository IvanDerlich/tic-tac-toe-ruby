require_relative '../graphics/errors.rb'

class Validations
    def initialize
        @errors = Errors.new
    end

    def symbol(symbol)
        @errors.handling(-2) if symbol != "x" && symbol != "o"                         
    end

    def inputed_position(inputed)  
        return 21 if inputed > 9        
        return 22 if inputed < 1   
    end

    def free_position(actual)
        return 33 if actual == 'x' || actual == 'o' 
    end

    def valid_position(board,inputed)
        error1 = inputed_position(inputed)                
        unless error1                             
            error2 = free_position(board.state[inputed] )
            unless error2
                valid_position = true
            else
                @errors.handling(error2) 
            end
        else
            @errors.handling(error1)
        end  
    end
    
end 