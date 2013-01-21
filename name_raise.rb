class Name
  attr_accessor :first_name, :last_name
  def initialize f_name, l_name
    raise 'first name cant be null' if f_name.empty?
    raise 'first name begins with capital' unless f_name.capitalize == f_name 
    raise 'last name cant be null' if l_name.empty?
    @first_name, @last_name = f_name, l_name
    puts "welcome " + @first_name + " " + @last_name
  rescue
    puts 'first name with first alphabet in capitals and none null'
    get_name
  end
end
def get_name
  puts 'Enter first name(begin with capital) '
  first_name = gets.chomp
  puts 'Enter last name'
  last_name = gets.chomp
  new_name = Name.new( first_name, last_name)
end
get_name
