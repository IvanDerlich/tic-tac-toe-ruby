class Errors
    def handling(code)      
        puts "Input error number #{code}:"
        case code
        when -2
            puts "Error #2: Invalid symbol, program exists"
            exit         
        when 21       
            puts "Position is greater than 9"
        when 22     
            puts "Position is lower than 1"
        when 33            
            puts "Position already taken"
        else
            puts "Error: Never should have reach this section. Exiting program"
            exit
        end
        
        puts "The same player keeps playing"  if(code >= 20 && code <= 39)             
    end    
end