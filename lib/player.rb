require_relative 'validations.rb'

class Player
    attr_reader :symbol, :number

    def initialize(symbol, number)
        validations = Validations.new        
        validations.symbol(symbol)  
        @symbol = symbol
        @number = number
    end
end