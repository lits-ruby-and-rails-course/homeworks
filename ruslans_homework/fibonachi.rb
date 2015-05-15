def fib(n)
  a,b,c,d,rc,rd = 1,1,1,0,0,1
  while n >= 1
    if n%2 == 1
      tc = rc
      rc = rc*a + rd*c
      rd = tc*b + rd*d
    end
    ta = a; tb = b; tc = c
    a = a*a  + b*c
    b = ta*b + b*d
    c = c*ta + d*c
    d = tc*tb+ d*d
    n /= 2
  end
  rc
end
puts fib(50000)