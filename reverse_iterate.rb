class Array
  def reverse_iterate 
    self.reverse!
    self.each { |i| yield i }
  end
end
[2,4,6,8].reverse_iterate { |i| print "#{i} " }
