require_relative 'validations.rb'

class Player
    attr_reader :symbol, :number

    def initialize(symbol, number)
        validations = Validations.new        
        error_code = validations.symbol(symbol)
        if error_code
            Errors.new.handling(error_code)
            return false
        end
        @symbol = symbol        
        @number = number
        true
    end
end