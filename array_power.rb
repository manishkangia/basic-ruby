class Array
  def power ( raise_to )
    self.map { |item| (item)**raise_to }
  end
end
print [1,2,3,4,5,6].power ( 2 )
