class Item
  @@store = Hash.new()
  @@current_total = 0
  attr_accessor :name, :isimported, :price, :isexempted, :sales_tax, :duty_charges, :grand_total
  def grand_total
    @sales_tax = @isexempted ? 0 : ((0.1)*@price).round(2)
    @duty_charges = @isimported ? ((0.05)*@price).round(2) : 0
    @grand_total = (@price + @sales_tax + @duty_charges).to_i
    @@current_total += @grand_total
    save_product
  end
  def save_product
    @@store[@@store.length] = [@name, @price, @sales_tax, @duty_charges, @grand_total]
  end
  def display_items
    puts "Name".center(15) + "Price".center(15) + "Sales-Tax".center(15) + "Import_Charges".center(15) + "Total".center(15)
    @@store.each do |index,value| 
      value.each { |display| print display.to_s.center(15) }
      puts 
    end
    puts "Your total bill is #{@@current_total}"
  end
end

def purchase_item
  new_item = Item.new()
  print "Name of the product: "
  new_item.name = gets.chomp
  print "Imported?: "
  new_item.isimported = gets.chomp == 'no' ? false : true
  print "Exempted from sales tax? "
  new_item.isexempted = gets.chomp == 'no' ? false : true
  print "Price: "
  new_item.price = gets.chomp.to_i
  new_item.grand_total
  print "Do You want to enter more items to your list(y/n)"
  gets.chomp == 'y' ? purchase_item : new_item.display_items
end
purchase_item
