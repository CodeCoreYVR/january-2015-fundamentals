print "What is the year of your car? "

year = gets.chomp.to_i

if year > 2015
  puts "Future Car"
elsif year > 2010
  puts "New Car"
elsif year > 2000
  puts "Old Car"
else
  puts "Very Old Car"
end

if year == 2015
  puts "It's brand new"
end

puts "It's brew new" if year == 2015

puts "It's not brand new" unless year >= 2015
puts "It's not brand new" if year < 2015


