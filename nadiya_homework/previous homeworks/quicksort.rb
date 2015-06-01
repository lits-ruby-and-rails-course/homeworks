foo = *(1..20)
foo.shuffle!

puts "Unsorted array:"
print foo, "\n"

def quicksort! arr
   return arr if arr.length <= 1
   m = arr.shift
   left, right = arr.partition { |e| e < m }
   quicksort!(left) + [m] + quicksort!(right)
end

puts "Sorted array:"
print quicksort!(foo), "\n"