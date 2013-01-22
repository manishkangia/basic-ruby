class Integer
  def to_roman
    return 'not valid' if self <= 0 || self >= 4000
    roman_rep = ""
    number = self
    begin
      number_size = number.to_s.size - 1
      roman_rep += first_roman_for( number ) if number >= 10 ** ( number_size )
      number = number % 10 ** ( number_size )
    end while number > 0
    return roman_rep
  end
  
  #return the roman representation for the first digit in the number passed in
  def first_roman_for( number )
    map = {
            1 => 'I',
            5 => 'V',
            10 => 'X',
            50 => 'L',
            100 => 'C',
            500 => 'D',
            1000 => 'M'
          }
    
    decimal_place = number.to_s.size - 1  # the number of digits in the number passed
    factor = 10 ** decimal_place          # the factor : 1 for one's place , 10 for tens place : the factor for the digit we are working on 
    
    #append the roman_representation according to the digit
    return ( map[factor] ) * ( number/(factor) ) if number < 4 * factor  
    return ( map[factor] + map[ 5*factor ] ) if number >= 4 * factor && number < 5 * factor
    return ( map[ 5 * factor ] ) if number >= ( 5 * factor ) && number < ( 6 * factor )
    return ( map[ 5 * factor ] + ( map[ factor ] * (( number - 5*factor )/factor) )) if number >= 6 * factor && number < 9 * factor
    return ( map[factor] + map[ 10 * factor ] ) if number >= 9 * factor
  end
end

puts "enter the number to find its roman representation"
num = gets.chop.to_i
puts num.to_roman
