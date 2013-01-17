require 'time'
def add_time time_1, time_2
  valid_regex = /^(([0-1][0-9])|([2][0-3])|([0-9])):[0-5]?[0-9]:[0-5]?[0-9]$/
  if ( (time_1 =~ valid_regex) && (time_2 =~ valid_regex ) )
    t1 = Time.strptime(time_1,'%H:%M:%S')
    t2 = Time.strptime(time_2,'%H:%M:%S')
    sum_time = t1 + t2.sec + t2.min * 60 + t2.hour * 3600
    sum_time = (sum_time - Time.strptime('0:0:0','%H:%M:%S')).to_i
    days = sum_time/86400
    sum_time = sum_time%86400
    hours = sum_time/3600
    sum_time = sum_time%3600
    mins = sum_time/60
    secs = sum_time%60
    puts "#{days} day(s) & #{hours}:#{mins}:#{secs}"
    else puts 'invalid time values'
  end
end

puts 'enter two times to add them'
time_1 = gets.chomp
time_2 = gets.chomp
add_time time_1, time_2
