print "What is your grade? "

grade = gets.chomp.to_f

if grade >= 90
  puts "You got an A! Good job."
elsif grade >= 80
  puts "You got a B"
elsif grade >= 70
  puts "You got a C"
else
  puts "You got an F"
end
