# Very dirty code to make some dirty gym...
def hop_hop_hop(number_of_exercises)

  count = 1
  (1..number_of_exercises).each do |x|
    string = "hop ! "*count
    count += 1
    puts "#{string} One more time.."
  end

end

hop_hop_hop(6)
