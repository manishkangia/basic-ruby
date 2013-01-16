class Array
  def length_hash
    store_by_length = Hash.new{ |hash, key| hash[key] = [] }
    for str in self
      store_by_length[str.to_s.length] << str
    end
  return store_by_length
  end
end
result_hash = ['abc','def',1234,234,'abcd','x','mnop',5,'zZzZ', 4586].length_hash
puts result_hash
