print "Give me a number"

number = gets.chomp.to_i

if number > 10
puts "Large"
else
puts "Small"
end

puts number > 10 ? "Large" : "Small"