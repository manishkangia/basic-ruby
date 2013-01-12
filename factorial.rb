class Integer
  def factorial
    (1..self).inject(1) { |result, n| result * n } if self >= 0
  end
end
puts 0.factorial
