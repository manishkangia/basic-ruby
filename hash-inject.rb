class Array
  def get_length_hash
    store_by_length = Hash.new { |hash, key| hash[key] = [] }
    for str in self
      store_by_length[str.to_s.length] << str
    end
  return store_by_length
  end

  def even_odd 
    collection_hash = get_length_hash
    collection_hash.inject( Hash.new { |hash, key| hash[key] = [] } ) do |result,hash_value| 
      if hash_value[0].to_i.odd? then result["odd"] << hash_value[1] 
        else result["even"] << hash_value[1]
      end
      result
    end
  end
end
result_hash = ['abc','def',1234,234,'abcd','x','mnop',5,'zZzZ', 4586].even_odd
puts result_hash
