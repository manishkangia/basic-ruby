def factorial num
  raise ArgumentError, 'Factorial for a negative number!!' if num < 0
  (1..num).inject(1) { |result,n| result = result*n }
  rescue ArgumentError
  puts 'the number is negative'
end
puts 'Enter a number to get its factorial'
puts factorial gets.chop.to_i
