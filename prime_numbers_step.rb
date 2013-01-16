require "mathn"
def print_prime_till num
  puts 2
  (1..num).step(2) { |a| puts a if a.prime? }
end
print_prime_till 500
