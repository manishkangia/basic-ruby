def calculate( oper1, operand, oper2 )
  eval( oper1.to_s + operand.to_s + oper2.to_s ) 
end
puts calculate( 3, :+, 2.4 )
