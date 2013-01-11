collection = ['abc','def',1234,234,'abcd','x','mnop',5,'zZzZ', 4586]
store_by_length = Hash.new()
for str in collection
  if store_by_length.keys.include? (str.to_s.length)
    store_by_length[str.to_s.length] << str
  else
    store_by_length[str.to_s.length] = []
    store_by_length[str.to_s.length] << str
  end
end
puts store_by_length
