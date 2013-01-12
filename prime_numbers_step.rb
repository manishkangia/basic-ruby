def get_prime_till num
  arr = []
  (1..num).each { |n| arr << n }
  (2..num/2).each do |n|
    (0..num).step(n) { |a| arr.delete( a ) if a != n }
  end
  arr
end
puts get_prime_till 500
