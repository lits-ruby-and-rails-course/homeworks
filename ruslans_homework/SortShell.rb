class QuickSort
  def Sort(a)
    QuickSort(a, 0, a.to_a.length - 1)
  end

  def PartSort(a, p, q)
    x = a[q]
    i = p-1
    for j in p..q-1
      if a[j] <= x
        i += 1
        a[i], a[j] = a[j], a[i]
      end
    end
    i += 1
    a[i], a[q] = a[q], a[i]
    i
  end

  def QuickSort(a, p, q)
    if p  < q
      i = PartSort(a, p, q)
      QuickSort(a, p, i - 1)
      QuickSort(a, i + 1, q)
    end
  end
end

puts 'n='
n = gets.to_i
puts 'd(m)'
m = gets.to_i
d = (1..m).to_a.reverse
puts d.to_s
a = (1..n).to_a.sort_by {rand}
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