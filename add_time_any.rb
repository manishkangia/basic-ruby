def add_time time_array
  sum_time = [0,0,0]
  time_array.each do |time1|
    print sum_time,time1
    sum_time[0] += time1[0].to_i 
    sum_time[1] += time1[1].to_i 
    sum_time[2] += time1[2].to_i 
  end

  if sum_time[2] >= 60 then sum_time[1] += sum_time[2]/60; sum_time[2] = sum_time[2]%60 end
  if sum_time[1] >= 60 then sum_time[0] += sum_time[1]/60; sum_time[1] = sum_time[1]%60 end
  if sum_time[0] >= 24 then print "#{sum_time[0]/24} day(s) & " ; sum_time[0] %= 24; end
  puts "#{sum_time[0]}:#{sum_time[1]}:#{sum_time[2]}"
end

def validate_add_times *time_values
  time_array, check = [],true
  time_values.each do |time_1| 
    if (time_1 =~ /^\d*:\d*:\d*$/) then time_array << time_1.split(':')
    else
      check = false
      break
    end
  end
    puts 'bad input' if( check == false )
    add_time time_array if (check)
end

validate_add_times "11:23:07","22:53:45","0:23:23","23:45:56"
