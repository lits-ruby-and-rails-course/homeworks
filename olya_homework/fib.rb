$cache = {
  1 => 1,
  2 => 1,
  3 => 1
}

def fibonacci(n)
    if n < 3
        1
    else
        fibonacci(n - 1) + fibonacci(n - 2)
    end
end

def fibonacci_cache(n)
  return $cache[n] if $cache[n]
  $cache[n] = fibonacci_cache(n - 2) + fibonacci_cache(n - 1)
end

#p fibonacci(40)
p fibonacci_cache(40000)
