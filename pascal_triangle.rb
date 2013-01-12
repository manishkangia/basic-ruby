def generate_pascal_triangle rows
  puts "1\n1 1\n"
  first_row = [1,1]
  begin 
    next_row = yield first_row 
    next_row.each { |num| print "#{num} " }
    first_row = next_row
    puts
  end while next_row.length <= ( rows )
end
generate_pascal_triangle (6) do |last_row| 
  new_row = [1]
  last_row.each_index { |value_at| new_row <<( last_row[value_at] + last_row[value_at + 1] ) if value_at < last_row.length - 1}
  new_row << 1
end
