def func(i)			#визначаємо фунцію
    if i < 3
        1
   	 else
          func(i - 1) + func(i - 2)
         end
     end
 
(1..500).each {|i| puts "#{func(i)}"} #ітеруємо фунцію func від 1 до 500 і виводимо значення на екран