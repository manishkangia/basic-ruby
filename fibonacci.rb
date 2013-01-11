def fib max_value
  first_num,sum = 0, 1
  print "Fibonacci series till #{max_value} : #{first_num}"
  while sum < max_value
    result_array = yield first_num,sum
    sum, first_num = result_array[0], result_array[1]
    print " #{sum}"
  end 
end
fib ( 1000 ) { |a,b| [a + b, b] }
