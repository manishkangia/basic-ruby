require 'time'
def add_time *time_array
  all_valid = validate_time time_array
  if all_valid 
    sum = 0
    time_array.each do |time1|
      t1 = Time.strptime(time1,'%H:%M:%S') 
      sum += t1.hour*3600 + t1.min*60 + t1.sec 
    end
    days,sum = div_func sum,86400
    hours,sum = div_func sum,3600
    mins,sum = div_func sum,60
    secs = sum%60
    puts "The sum is : #{days} day(s) & #{hours}:#{mins}:#{secs}"
  else puts 'invalid time values'
  end
end

def div_func value, div_by
  return value/div_by, value % div_by
end

def validate_time time_array
  valid_regex = /^(([0-1][0-9])|([2][0-3])|([0-9])):[0-5]?[0-9]:[0-5]?[0-9]$/
  time_array.each { |time1| return false unless time1 =~ valid_regex }
  return true
end
add_time "11:23:07","22:53:45","0:23:23","23:45:56"
