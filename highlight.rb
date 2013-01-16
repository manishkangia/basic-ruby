def search input_string, search_item
  can_count = 0
  puts input_string.gsub( /#{search_item}/i ){ |s| can_count += 1; "(#{s})" }
  puts "Total Occurences Found : #{can_count}"
end

puts 'Please enter a string to highlight and count the occurences of the word "can" '
search_string = gets.chomp

puts 'search for'
search_for = gets.chomp

search( search_string, search_for )
