class Interest
  attr_accessor :amount, :time
  @@rate = 10.0
  def simple_interest
    @amount += (@amount*@time*@@rate/100)
  end
  
  def compund_interest
    @amount*((1 + (@@rate/100))**@time)
  end

  def interest_diff
    "#{(compund_interest - simple_interest).round(3)}"
  end
end
int_obj = Interest.new()
puts "Enter the initial_amount depositied and the time period to compare SI and CI amounts"
int_obj.amount = gets.chop.to_i
int_obj.time= gets.chop.to_i
puts "Difference between compound interest and simple interest is #{int_obj.interest_diff}" 
