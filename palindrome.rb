def check_palindrome test_string
  if test_string.eql?( test_string.reverse ) then puts "#{test_string} is a palindrome"
  else puts 'not a palindrome'
  end
end
begin
  input = gets.chop
  check_palindrome( input ) unless input =~ /^[q]$/i || input.include?( ' ' )
  puts "No white space" if input.include?( ' ' )
end until input =~ /^[q]$/i
