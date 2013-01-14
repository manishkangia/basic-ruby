class Name
  attr_accessor :first_name, :last_name
  def first_name
    raise 'first name cant be null' if @first_name.length == 0
    if @first_name.length > 0
      raise 'first name begins with capital' unless @first_name[0].capitalize == @first_name[0]
    end
    @first_name
  end
  def last_name 
    raise 'last name cant be null' if @last_name.length == 0
    @last_name
  end
end
new_name = Name.new()
puts 'Enter first name(begin with capital) '
new_name.first_name = gets.chomp
new_name.first_name
puts 'Enter last name'
new_name.last_name = gets.chomp
puts "welcome " + new_name.first_name + " " + new_name.last_name
