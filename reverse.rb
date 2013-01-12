puts 'enter the sentence to be reversed'
gets.chomp.split(' ').reverse.each { |word| print "#{word} "}
puts
