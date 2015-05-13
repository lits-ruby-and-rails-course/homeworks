require 'pry'
foo = *(1..20)
foo.shuffle!

puts "Unsorted array:"
print foo, "\n"

def quicksort! arr, left, right

	if left < right

		x = arr[right]
		i = left - 1

		(left...right).each do |j|
			if arr[j] <= x
				i += 1
				arr[i], arr[j] = arr[j], arr[i]
			end
		end

		arr[i + 1], arr[right] = arr[right], arr[i + 1]

		m = i +1 

		quicksort!(arr, left, m - 1)
		quicksort!(arr, m + 1, right)
	end

	arr
end

puts "Sorted array:"
print quicksort!(foo, 0, foo.length - 1), "\n"
