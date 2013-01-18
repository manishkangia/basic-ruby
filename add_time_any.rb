require 'time'
def add_time *time_array
  all_valid = validate_time time_array
  if all_valid 
    sum = [0,0,0]
    time_array.each do |time1|
      t1 = Time.strptime(time1,'%H:%M:%S') 
      sum[0] += t1.hour
      sum[1] += t1.min
      sum[2] += t1.sec 
    end
    sum = sum[0] * 3600 + sum[1] * 60 + sum[2]
    days = sum/86400
    sum = sum%86400
    hours = sum/3600
    sum = sum%3600
    mins = sum/60
    secs = sum%60
    puts "The sum is : #{days} day(s) & #{hours}:#{mins}:#{secs}"
  else puts 'invalid time values'
  end
end

def validate_time time_array
  valid_regex = /^(([0-1][0-9])|([2][0-3])|([0-9])):[0-5]?[0-9]:[0-5]?[0-9]$/
  time_array.each { |time1| return false unless time1 =~ valid_regex }
  return true
end
add_time "11:23:07","22:53:45","0:23:23","23:45:56"
