class Item
  attr_accessor :name, :isimported, :price, :isexempted, :sales_tax, :duty_charges, :grand_total
  SALES_TAX = 0.1
  IMPORT_DUTY = 0.05
  def initialize name, isimported, isexempted, price
    @name = name
    @isimported = isimported
    @isexempted = isexempted 
    @price = price
    @sales_tax = @isexempted ? 0 : ((SALES_TAX)*@price).round(2)
    @duty_charges = @isimported ? ((IMPORT_DUTY)*@price).round(2) : 0
    @grand_total = (@price + @sales_tax + @duty_charges).round(0)
  end  
end

class BoughtItems
  attr_accessor :items_list,:current_total
  def initialize
    @items_list, @current_total = [], 0
  end
  def purchase
    print "Name of the product: "
    name = gets.chomp
    print "Imported?: "
    isimported = gets.chomp == 'no' ? false : true
    print "Exempted from sales tax? "
    isexempted = gets.chomp == 'no' ? false : true
    print "Price: "
    price = gets.chomp.to_i
    @items_list << Item.new( name, isimported, isexempted, price)
    print "Do You want to enter more items to your list(y/n)"
    gets.chomp == 'y' ? purchase : display_items
  end
  def display_items
    puts "Name".center(15) + "Price".center(15) + "Sales-Tax".center(15) + "Import_Charges".center(15) + "Total".center(15)
    @items_list.each do |item| 
      puts item.name.center(15) + item.price.to_s.center(15) + item.sales_tax.to_s.center(15) + item.duty_charges.to_s.center(15) + item.grand_total.to_s.center(15)
      @current_total += item.grand_total
    end
    puts "Your total bill is #{@current_total}"
  end
end
new_item_list = BoughtItems.new()
new_item_list.purchase
