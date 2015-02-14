print "Give me a number: "

number = gets.chomp.to_i

if number > 10
  puts "Hello"
elsif number > 5
  puts "Hola"
else
  puts "Hi"
end
