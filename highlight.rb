puts 'Please enter a string to highlight and count the occurences of the word "can" '
can_count = 0
puts gets.gsub( /can/ , '(Can)' ).scan( /(Can)/ ) { can_count += 1 }
puts "Total Occurences Found : #{can_count}"
