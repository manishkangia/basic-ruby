def check_palindrome test_string
  if test_string.eql?( test_string.reverse ) then puts "#{test_string} is a palindrome"
  else puts 'not a palindrome'
  end
end
begin
  input = gets.chop.strip
  if input.length > 1 && !input.include?( ' ' ) then check_palindrome( input )
    elsif input =~ /^[^q]$/i then puts "#{input} is a palindrome"
      elsif input.include?( ' ' ) then puts "Plaindrome is only for a single word"
  end
end until input =~ /^[q]$/i
