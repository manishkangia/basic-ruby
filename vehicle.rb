class Vehicle
  attr_accessor :name, :price
  def initialize name, price
    @name = name
    @price = price
  end
  def display_content 
    puts "name : #{name}\nprice : #{price}"
  end
end
class Bikes < Vehicle
  attr_accessor :dealer
  def initialize ( name, price, dealer )
    super( name, price )
    @dealer = dealer
  end
  def display_bike_content
    puts "name : #{name}\nprice : #{price}\ndealer : #{dealer}"
  end
end
new_bike = Bikes.new( 'pulsar', 72200, 'Bajaj' )
new_bike.display_bike_content
new_bike.price = 84000
new_bike.display_bike_content
