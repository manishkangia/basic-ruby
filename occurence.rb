def get_alpha_count
  puts 'enter a string'
  input_string = gets.chomp
  char_counts = Hash.new(0)
  input_string.each_char { |c| char_counts[c] += 1 if c =~ /[A-z]/ }
  return char_counts
end
get_alpha_count.each { |key,value| puts "\"#{key}\" => #{value}\ "}
