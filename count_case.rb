class String
  def count_case
    count_hash = Hash.new(0)
    self.each_char do |c|
      if ('a'..'z').include? c then count_hash["lowercase"] += 1
        elsif ('A'..'Z').include? c then count_hash["uppercase"] += 1
        elsif ('0'..'9').include? c then count_hash["digits"] += 1
        else count_hash["special"] += 1
      end
    end
    count_hash
  end
end
puts "wHat ARE yoU DoiNG @ 123 %%\n\n".count_case
