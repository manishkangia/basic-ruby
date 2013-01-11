def check_palindrome test_string
  if test_string.eql?( test_string.reverse ) then puts "#{test_string} is a palindrome"
  else puts 'not a palindrome'
  end
end
begin
  input = gets.chop
  check_palindrome input unless input.length < 2 #minimum 2 characters, also checks the possibility of entering q/Q to exit in first attempt
end until input =~ /[q]/i
