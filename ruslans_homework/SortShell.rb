puts 'n='
n = gets.to_i
puts 'd(m)'
m = gets.to_i
d = (1..m).to_a.reverse
puts d.to_s
a = (-5..n).to_a.sort_by {rand}
puts a.to_s
for
  k in 0 .. m - 1
  for i in d[k] .. n - 1
    ai = a[i]
    j = i
    while j - d[k] >= 0 and a[j - d[k]] > ai
      a[j] = a[j - d[k]]
      j = j - d[k]
    end
    a[j] = ai
  end
end
puts a.to_s
