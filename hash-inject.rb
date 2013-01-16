class Array
  def get_length_hash
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

  def even_odd 
    collection_hash = get_length_hash 
    save_even_odd = Hash.new()
    save_even_odd["even"],save_even_odd["odd"] = [],[]
    collection_hash.inject(save_even_odd) do |result,hash_value| 
      if hash_value[0].to_i.odd? then result["odd"] << hash_value[1] 
        elsif hash_value[0].to_i.even? then result["even"] << hash_value[1]
      end
      result
    end
  end
end
result_hash = ['abc','def',1234,234,'abcd','x','mnop',5,'zZzZ', 4586].even_odd
puts result_hash
