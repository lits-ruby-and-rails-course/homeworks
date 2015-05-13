foo = *(1..20)
foo.shuffle!

puts "Unsorted array:"
print foo, "\n"

def shellsort! arr
	d, i = arr.length / 2, 0

	while d >= 1 do

		#initial swap elements i and i+d
		arr[i], arr[i + d] = arr[i + d], arr[i] if arr[i] > arr[i + d]
			
		#diving of swaped element down 	
		j = i
		while (j - d >= 0) && (arr[j - d] > arr[j]) 
			arr[j], arr[j - d] = arr[j - d], arr[j]
			j -= d
		end

		#check if index is out of array, decrement interval and reset counter
		i += 1
		unless arr[i + d]
			d /= 2
			i = 0
		end

	end

	arr
end

puts "Sorted array:"
print shellsort!(foo), "\n"
