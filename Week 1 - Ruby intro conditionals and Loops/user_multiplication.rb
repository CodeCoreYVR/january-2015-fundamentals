print "Give me a number: "

number_1 = gets.chomp.to_f

print "Give me another number: "

number_2 = gets.chomp.to_f

result = number_1 * number_2

puts "The result is: " + result.to_s
puts "The result is: #{result}"
