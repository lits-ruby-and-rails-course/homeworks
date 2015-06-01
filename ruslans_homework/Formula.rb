class Formula
  def initialize(formula)
    @toS = formula.to_s
    @formula = formula
  end
  def inspect
    "<Formula #{@formula}>"
  end
  def add (f)
    @toS += ' + ' + f.to_s
    @formula += f
  end
  alias_method '+', 'add'
  def subtract (f)
    @toS += ' - ' + f.to_s
    @formula -= f
  end
  alias_method '-', 'subtract'
  def divide (f)
    @toS  = '(' + @toS + ') / ' + f.to_s
    @formula /= f
  end
  alias_method '/', 'divide'
  def multiply  (f)
    @toS  = '(' + @toS + ') * ' + f.to_s
    @formula *= f
  end
  alias_method '*', 'multiply'
  def result
    @formula
  end
  def to_s
    @toS
  end
end
