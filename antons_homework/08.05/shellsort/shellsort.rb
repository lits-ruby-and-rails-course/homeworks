array = [2,5,8,14,1,34]

def shell_sort(a)
  i = 0
  j = 0
  size = a.length
  increment = size / 2
  temp = 0

  while increment > 0
    i = increment
    while i < size
      j = i
      temp = a[i]
      puts "15: #{temp}"
      while j >= increment and a[j-increment] > temp
        puts "17: #{temp}"
        a[j] = a[j-increment]
        j = j - increment
      end

      a[j] = temp
      i += 1
    end

    if increment == 2
      increment == 1
    else
      increment = (increment/2).to_i
    end
  end
  return a
end

puts shell_sort(array)
