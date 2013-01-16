def search input_string, search_item
  can_count = 0
  puts input_string.gsub( /#{search_item}/i ){ |s| "(#{s})" }
  input_string.scan( /#{search_item}/i ) { can_count += 1 }
  puts "Total Occurences Found : #{can_count}"
end

puts 'Please enter a string to highlight and count the occurences of the word "can" '
search_string = gets.chomp

puts 'search for'
search_for = gets.chomp

search( search_string, search_for )
