# puts "Give me a number"

# number_1 = gets.chomp

# puts "Give me another number"

# number_2 = gets.chomp

# puts "You Have Entered: " + number_1 + " And " + number_2

# puts "Give me your first name"

# first_name = gets.chomp

# puts "Give me your last name"

# last_name = gets.chomp

# puts first_name.capitalize + " " + last_name.capitalize


# puts "Give me a number"

# number_1 = gets.chomp.to_f

# puts "Give me another number"

# number_2 = gets.chomp.to_f


# puts "The resulting multiplications is: #{number_1 * number_2}"


# puts "Please give us your name"


# name = gets.chomp


# if name.length > 20
#   puts "Your name is very long"
# elsif name.length > 15
#   puts "Your name is long"
# else
#   puts "Your name is short"
# end


# puts "Give me the year of your car"

# year = gets.chomp.to_i


# if year > 2014
#   puts "The car is future"
# elsif year > 2010
#   puts "The car is new"
# elsif year > 2001
#   puts "The car is old"
# elsif year > 1980
#   puts "The car is very old"
# else
#   puts "The car is classic"
# end


# puts "Give me your grade"

# grade = gets.chomp.to_f

# if grade > 80
#   puts "A"
# elsif grade > 60
#   puts "B"
# elsif grade > 50
#   puts "C"
# else
#   puts "F"
# end

# puts (if grade > 80
#         "A"
#       elsif grade > 60
#         "B"
#       elsif grade > 50
#         "C"
#       else
#         "F"
#       end)


# puts "Give me a string"

# string = gets.chomp

# if string.length > 20
#   puts string.capitalize
# elsif string.length > 10
#   puts string.upcase
# else
#   puts string.downcase
# end

# unless string.length >  10
#   puts "Hello"
# else
#   puts "hey"  
# end

# puts "What's the year of your car"


# year = gets.chomp.to_i

# puts "Very Old" unless year >= 1950
# puts "Old"      unless year >= 1980 || year < 1950
# puts "New"      unless year >= 2005 || year < 1980
# puts "Very New" unless year >= 2014 || year < 2005
# puts "Very New" unless year year < 2014


# x = 1
# while x < 10
#   puts "Hello CodeCore"
#   x += 2
# end


# x = 1
# while x <= 50
#   puts x
#   x += 1
# end

# x = 50

# while x >= 1
#   puts x
#   x -= 1
# end





# puts "Give me a number"

# x = gets.chomp.to_i

# while x > 0
#   puts "Hello World"
#   x -= 1
# end


# x = 1

# until x > 10
#   puts x 
#   x += 1
# end


# puts "Give me a number"

# number = gets.chomp.to_i

# y = 1

# until y > 10
#   puts y * number
#   y += 1
# end


# x = 1

# until x > 60
#   puts x 
#   x += 2
# end



# for x in 1..12
#   if x == 5
#     puts "HHHHHHHH"
#   else
#     puts x
#   end
# end


# puts "Give me a number"

# x = gets.chomp.to_i

# if x <= 100
#   for y in x..100
#     puts y
#   end
# else
#   puts "You must enter a number less than or equal to a 100"
# end




# for x in 1..100
#   if x % 3 == 0 && x % 5 == 0
#     puts "FIZZBUZZ"
#   elsif x % 5 == 0
#     puts "BUZZ"
#   elsif x % 3 == 0
#     puts "FIZZ"
#   else
#     puts x
#   end
# end





# for x in 1..100
#   results = ""
#   results += "FIZZ" if x % 3 == 0
#   results += "BUZZ" if x % 5 == 0
#   puts results == "" ? x : results
# end



# 1.upto(7) { puts "Hello CodeCore" }

# 1.upto(100) do |x|
#   puts x
# end

# 14.downto(1) {|x| puts x }

# 44.downto(4) do |x|
#   puts x
# end


puts "Give me a number.."

number_1 = gets.chomp.to_i

puts "Give me another number.."

number_2 = gets.chomp.to_i


# if number_1 > number_2
#   number_2.upto(number_1) { |n| puts n }
# else
#   number_1.upto(number_2) { |n| puts n }
# end

start  = number_1 < number_2 ? number_1 : number_2
finish = number_1 < number_2 ? number_2 : number_1
start.upto(finish) {|n| puts n}



















