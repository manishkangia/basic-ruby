class Integer
  def factorial
    (1..self).inject(1) { |result, n| result * n }
  end
end
puts 5.factorial
