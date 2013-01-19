require 'json' 
require 'date'

class Hotel
  attr_accessor :name, :rate, :tax
  def initialize name, rate, tax
    @name, @rate, @tax = name, rate, tax
  end
end

class Offer
  attr_accessor :name, :start, :end, :rate
  def initialize name, start_date, end_date, rate                       # initialize name, rate
    @name, @rate = name, rate                                           # append the current year in the start date and end date
    current_year = Time.now().year                                      # accordingly and change them to Date objects
    @start = Date.strptime( start_date + "-#{current_year}", '%d-%m-%Y' )
    @end = ( end_date.split('-')[1] < start_date.split('-')[1] ) ? Date.strptime( end_date + "-#{(current_year.to_i + 1)}", '%d-%m-%Y' ) : Date.strptime( end_date + "-#{(current_year.to_i)}", '%d-%m-%Y' )
  end
end

class BillComparison
  attr_accessor :from, :to, :season_offer_hash, :hotels                 # from and is for the visit
                                                                        # season_offer_hash is the hash of 'Offer' class objects 
  def initialize                                                        # hotels is an array of 'Hotel' class objects
    file = open( "hotels.json" )
    content_file = file.read
    hotels_json = JSON.parse( content_file )
    @hotels = []
    @season_offer_hash = Hash.new{ |h,key| h[key] = [] }
    create_hotels_offers hotels_json
  end
  
  def create_hotels_offers hotels_json                                  # creates an array of 'Hotel' & 'Offer' objects and
    hotels_json.each do |hotel_details|                                 # puts them in the instance variables
      @hotels[ @hotels.length ] = Hotel.new( hotel_details[ "Hotel_name" ], hotel_details[ "rate" ], hotel_details[ "tax" ] )
      hotel_details["seasonal_rates"].each do |offer_details|
        name, details_hash = offer_details.keys[0], offer_details.values[0]
        new_offer = Offer.new name, details_hash["start"], details_hash["end"], details_hash["rate"]
        @season_offer_hash[ hotel_details[ "Hotel_name" ] ] << new_offer
      end if hotel_details["seasonal_rates"]
    end
  end  
  
  def get_info
    p "Arrival date(dd/mm/year) : "
    @from = gets.chop
    p "Checkout date : "
    @to = gets.chop
    begin 
      @from = Date.strptime( @from, '%d/%m/%Y' ) 
      @to = Date.strptime( @to, '%d/%m/%Y' )
      rescue then puts 'Invalid date'
    end
  end
    
  def get_hotel_rate_tax hotel_name
    hotel = @hotels.select { |hotel| hotel.name == hotel_name }[0]
    return hotel.rate.to_i, hotel.tax ? hotel.tax.to_f : 0 
  end
  
  def check_offers hotel_name
    @season_offer_hash[ hotel_name ].each do |offer|
          return offer if @from <= offer.start && @to >= offer.start
    end
    return false
  end
  
  def display_comparison  
    begin
      @hotels.each do |hotel_object|
        normal_rate, normal_tax = get_hotel_rate_tax( hotel_object.name )
        offer_available = check_offers( hotel_object.name )
        if offer_available then offer_display( hotel_object.name, offer_available, normal_rate, normal_tax )
        else
          bill = ( ( ( @to - @from ).to_i + 1 ) * normal_rate ) * ( 1 + normal_tax/100 )
          puts "\n\nStay at #{hotel_object.name} \n From : #{@from.strftime("%m/%d/%Y")} \t\t\t To : #{@to.strftime("%m/%d/%Y")}\n TOTAL : #{bill.to_i}"
        end
      end
      rescue then puts 'Comparison not done'
    end
  end

  # o stands for offer like  o_from : offer_from, o_to : offer_to, o_rate : offer rate
  def offer_display( hotel_name, offer_available , normal_rate, normal_tax )
    o_from, o_to, o_rate = offer_available.start, offer_available.end , offer_available.rate.to_i 
    visit_time_period = ( @to - @from ).to_i + 1
    puts "\n\n****Amazing choice, you are walking in during a special season**** 
    '#{offer_available.name.upcase}' from #{o_from.strftime("%m/%d/%Y")} till #{o_to.strftime("%m/%d/%Y")} at #{hotel_name}"
    bill = calculate_bill( hotel_name, visit_time_period, o_to, o_from, o_rate, normal_rate, normal_tax )
    puts "\nStay at #{hotel_name} \n From : #{from.strftime("%m/%d/%Y")} \t\t\t To : #{to.strftime("%m/%d/%Y")} (including offer)\n TOTAL : #{bill.to_i}"
  end
  
  def calculate_bill hotel_name, visit_time_period, o_to, o_from, o_rate, normal_rate, normal_tax
    offer_time_period = (o_to - o_from).to_i + 1
    offer_days = ( visit_time_period > offer_time_period ) ? offer_time_period : visit_time_period
    normal_days = visit_time_period - offer_days
    bill = ( offer_days * (o_rate) + normal_days * (normal_rate) ) * ( 1 + normal_tax/100 )
  end
end

new_bill_comparison = BillComparison.new()
new_bill_comparison.get_info
new_bill_comparison.display_comparison
