class Customers
  @@customer_total = 0
  attr_accessor :name, :account_no, :balance
  def initialize ( cust_name )
    @name = cust_name
    @account_no = @@customer_total
    @@customer_total += 1
    @balance = 1000
  end
  def deposit amount
    @balance += amount if amount > 0
  end
  def withdrawl amount
    if ( @balance - amount )> 0 && amount > 0 then @balance -= amount
    elsif ( @balance - amount )< 0 && amount > 0 then puts 'insufficient balance for such a withdrawl, action aborted'
    else puts 'inappropriate quatity' 
    end
  end
end
new_customer = Customers.new ('smith')
puts new_customer.inspect

new_customer.deposit 1000 
puts new_customer.inspect

new_customer.withdrawl -500 #bad input
puts new_customer.inspect

new_customer.withdrawl 2500 #excess withdrawl
puts new_customer.inspect

new_customer = Customers.new ('Bob')
puts new_customer.inspect
