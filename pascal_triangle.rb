def generate_pascal_triangle rows
  puts "1\n1 1\n"
  row = [1,1]
  begin
    row = yield row 
    puts
  end while row.length <= ( rows )
end
generate_pascal_triangle (6) do |last_row|
  new_row = [1]
  last_row.each_index do |value_at| 
    new_row << ( last_row[value_at] + last_row[value_at + 1] ) if value_at < last_row.length - 1 
  end
  new_row << 1
  new_row.each { |value| print "#{value} " }
end
