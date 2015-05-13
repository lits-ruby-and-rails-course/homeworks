 foo, bla =  *(1..10), []
 foo.each {|i| bla << i if foo.index(i).even?}
 puts bla
 
string, students = 'Abc', []
20.times do |time| 
	students << string = string.next
end

groups = students.each_slice(5).to_a

groups.each_with_index do |g, i|
	puts "Група № #{i+1}"
	g.each_with_index {|s, i| puts "#{i+1}). #{s}"}
end

