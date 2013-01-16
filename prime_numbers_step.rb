require "mathn"
def print_prime_till num
  (0..num).step(1) { |a| puts a if a.prime? }
end
print_prime_till 500
