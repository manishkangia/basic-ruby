employee_record = Hash.new('')
IO.foreach("employee.csv") do |line| 
  details = line.split(',')
  employee_record [details[2].strip] += "#{details[0]}(EmpId: #{details[1]})\n"
end

file_stream = IO.sysopen("employee_record.csv", "w")
a = IO.new(file_stream, "a")
employee_record.each { |key, value| a.write(key + ":\n" + value + "\n") }
