class Interest
  attr_accessor :amount, :time
  @@rate = 10.0
  def simple_interest
    @amount += (@amount*@time*@@rate/100)
  end
  
  def compund_interest
    @amount*((1 + (@@rate/100))**@time)
  end
end
def interest_diff
  puts "Enter the initial_amount depositied and the time period to compare SI and CI amounts"
  pri = gets.chop
  time_period = gets.chop
  obj = Interest.new.tap do |a|
    a.amount = pri.to_i
    a.time = time_period.to_i
  end
  puts "Difference ( CI - SI ) is #{(obj.compund_interest - obj.simple_interest).round(3)}"
end
interest_diff
