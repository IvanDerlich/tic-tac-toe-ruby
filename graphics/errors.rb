class Errors
    def handling(code)
        case code
        when -2
            puts "Error #2: Invalid symbol, program exists"
            exit 
        when 20
            input_error(code)
            puts "Position is not an integer"
            same_player_keeps_playing
        when 21        
            input_error(code)  
            puts "Position is greater than 9"
            same_player_keeps_playing
        when 22        
            input_error(code)  
            puts "Position is lower than 1"
            same_player_keeps_playing
        when 23            
            input_error(code)  
            puts "Position already taken"
            same_player_keeps_playing
        when 24
            input_error(code)  
            puts "Can't enter null position"        
            same_player_keeps_playing
        else
            puts "Error: Never should have reach this section. Exiting program"
            exit
        end
    end

    def same_player_keeps_playing
        puts "The same player keeps playing"
    end
    def input_error (code)
        puts "Input error number #{code}:"
    end
    
end