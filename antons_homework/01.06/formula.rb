class Formula
  def initialize(num)
    @number = num
    @string = "#{@number}"
  end

  def add(num)
    @number += num
    @string += " + #{num}"
    return @number
  end

  def subtract(num)
    @number -= num
    @string += " - #{num}"
    return @number
  end

  def divide(num)
    @number /= num
    @string.insert(0, '(')
    @string.insert(-1, ')')
    @string += " / #{num}"
    return @number
  end

  def multiply(num)
    @number *= num
    @string.insert(0, '(')
    @string.insert(-1, ')')
    @string += " * #{num}"
    return @number
  end

  def result
    @number
  end

  def to_s
    @string
  end

  alias_method :'+', :add
  alias_method :'-', :subtract
  alias_method :'/', :divide
  alias_method :'*', :multiply
end