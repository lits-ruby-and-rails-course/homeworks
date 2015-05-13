def fib (n)
  x = 0
  y = 1

  (1..n).each do
    z = (x + y)
    x = y
    y = z
  end

  return y
end

puts fib 50000