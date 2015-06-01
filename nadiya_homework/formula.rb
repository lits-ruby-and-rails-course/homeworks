class Formula
    
    def initialize(number)
        @number = number
    end
        
    def add(n)
        puts @number += n
    end
    
    def subtract(n)
        puts @number -= n
    end
    
    def divide(n)
        puts @number /= n
    end
    
    def multiply(n)
        puts @number *= n
    end
    
    def result
        return @number
    end
    
    def to_s
        
    end
end
 
a = Formula.new(5)
a.add(10)
a.subtract(3)
a.divide(6)
a.add(8)
a.multiply(8)
a.result