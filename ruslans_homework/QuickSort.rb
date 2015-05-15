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

n = gets.to_i
a = (1..n).to_a.sort_by {rand}
puts a.to_s
QuickSort.new.Sort(a)
puts a.to_s
