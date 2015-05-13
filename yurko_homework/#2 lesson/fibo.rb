def fibo a 
	memo = {l: 0, r: 1}
	
	a.times do 
		memo[:l], memo[:r] = memo[:r], (memo[:l] + memo[:r]) 
	end

	memo[:l]
end

puts fibo 50_000