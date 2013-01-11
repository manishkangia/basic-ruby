def get_alpha_count
  puts 'enter a string'
  input_string = gets.chomp
  s2 = []
  input_string.each_char { |c| s2 << c if c =~ /[A-z]/ }
  counts = Hash.new(0)
  s2.each { |alpha| counts[alpha] += 1 }
  return counts
end
puts get_alpha_count
