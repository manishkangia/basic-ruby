def generate_pascal_triangle rows
  puts "1\n1 1\n"
  row = [1,1]
  begin
    new_row = [1]
    row.each_index do |value_at| 
      new_row << ( row[value_at] + row[value_at + 1] ) if value_at < row.length - 1 
    end
    new_row << 1
  new_row.each { |value| yield value }
  puts
  row = new_row
  end while row.length <= ( rows )
end
generate_pascal_triangle (6) { |num| print "#{num} " }
