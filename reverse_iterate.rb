class Array
  def reverse_iterate 
    self.reverse!
    for num in self
      yield num
    end
  end
end
[2,4,6,8].reverse_iterate { |i| print "#{i} " }
