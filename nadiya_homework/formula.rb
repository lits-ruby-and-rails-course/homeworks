class Formula
    
    def initialize(number)
        @number = number
        @str = number.to_s
    end
        
    def add(n)
        @str += "+" + n.to_s
        puts @number += n
    end
    
    def subtract(n)
        @str += "-" + n.to_s
        puts @number -= n
    end
    
    def divide(n)
        @str = "(" + @str + ")"  + "/" + n.to_s
        puts @number /= n
    end
    
    def multiply(n)
        @str = "(" + @str + ")"  + "*" + n.to_s
        puts @number *= n
    end
    
    def result
        return @number
    end
    
    def to_s
        @str
    end

    alias :+ :add
    alias :- :subtract
    alias :* :multiply
    alias :/ :divide

end
 
a = Formula.new(5)
a.add(10)
a.subtract(3)
a.divide(6)
a.add(8)
a.multiply(8)
a-12
a/2
a+7
a*3
a.result
a.to_s