def add_time time1, time2
  time1 = time1.map { |num| num.to_i }
  time2 = time2.map { |num| num.to_i }
  sum_time = []
  sum_time[0] = time1[0] + time2[0]
  sum_time[1] = time1[1] + time2[1]
  sum_time[2] = time1[2] + time2[2]
  if sum_time[2] > 60 then sum_time[1] += sum_time[2]/60; sum_time[2] = sum_time[2]%60 end
  if sum_time[1] > 60 then sum_time[0] += sum_time[1]/60; sum_time[1] = sum_time[1]%60 end
  if sum_time[0] >= 24 then print "#{sum_time[0]/24} day(s) & " ; sum_time[0] %= 24; end
  puts "#{sum_time[0]}:#{sum_time[1]}:#{sum_time[2]}"
end

puts 'enter two times to add them'
time_1 = gets.chomp
time_2 = gets.chomp
if ( (time_1 =~ /^(([0-1][0-9])|([2][0-3])|([0-9])):[0-5]?[0-9]:[0-5]?[0-9]$/) && (time_2 =~ /^(([0-1][0-9])|([2][0-3])|([0-9])):[0-5]?[0-9]:[0-5]?[0-9]$/ ) ) then add_time time_1.split(':'), time_2.split(':')
  else puts 'invalid time values'
end
