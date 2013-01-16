class Array
  def length_hash
    store_by_length = Hash.new()
    for str in self
      if store_by_length.keys.include? (str.to_s.length)
        store_by_length[str.to_s.length] << str
        else
          store_by_length[str.to_s.length] = []
          store_by_length[str.to_s.length] << str
      end
    end
  return store_by_length
  end
end
result_hash = ['abc','def',1234,234,'abcd','x','mnop',5,'zZzZ', 4586].length_hash
puts result_hash
