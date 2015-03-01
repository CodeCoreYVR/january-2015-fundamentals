# Ruby Fundamentals  
The goal of this course is to be able to build a web application using Ruby, HTML, and CSS by the end of the course.  
  
Ruby was created by [Yukihiro Matsumoto](http://en.wikipedia.org/wiki/Yukihiro_Matsumoto) 'Matz'. Ruby is a general purpose programming language, meaning you can build all sorts of programs with it. It is known as an [interpreted language](http://en.wikipedia.org/wiki/Interpreted_language), as opposed to a [compiled language](http://en.wikipedia.org/wiki/Compiled_language).  
  
Open up your terminal and type `irb`. This will bring us into the interactive shell. To exit the interactive shell, trpe `exit`.  
  
```ruby
# comments in ruby use a hash tag
# Let's try some ruby in the terminal

# print 'hello' to the terminal
puts "Hello"

# set a variable with the equals sign
a = 5                       # a is set to five
b = a * 5                   # b is equal to a (five) times five
c = a + 5                   

# set a variable for name 
my_name = "Tam"  
```  
1.) Set a variable a to "Hello", and b to "World", and then set c to be a + b  
```
a = "Hello"
b = "World"
c = a + " " + b
```  
Open up Sublime and create a file called "test.rb" in your home folder. Then open it in the regular terminal, not irb using `ruby test.rb`   
```ruby
# test.rb
puts "Give me a number"

number_1 = gets.chomp
puts "Give me another number"

number_2 = gets.chomp

puts "You have Entered: " + number_1 + " And " + number_2
```
2.) Write a code that prompts a user for their first name, then their last name.  
```ruby
puts "Give me your first name"

first_name = gets.chomp

puts "Give me your last name"

last_name = gets.chomp

puts first_name + " " + last_name
```  
Let's go back into `irb` mode and experiment with [strings](http://www.ruby-doc.org/core-2.1.0/String.html).  
```ruby
name = "drew"          # set a variable called name to a string "tam"
name.class            # check the class of the variable name
name.capitalize       # this will capitalize the first 

```  
3.) Prompt the user for their first name and last name, then print the full name capitalized.  
```ruby
puts "What is your first name?"

first_name = gets.chomp  

puts "What is your last name?"

last_name = gets.chomp

full_name = first_name + " " + last_name

puts "Nice to meet you " + full_name
```  
4.) Find out from the Ruby DOcs how to rplace a pattern in a String with another.  
```ruby
a = "my name is Drew."
a.gsub("is", "was")             # this returns the string "my name was Drew." but doesn't change the value of a
a.gsub!("is", "was")            # when a method changes the value of the string, we call it descructive.
```  
You don't have to memorize every method. As long as you know where to look in the docs, you can reference them when needed, then test them out in irb to make sure they are the methods you want to use.  
  
Let's do some simple math operations  
```ruby
a = 5 * 5
b = a * 7
c = 10 / 3
10.class        # this is a FixNum, basically just an integer
10.0 / 3        # this will now return the answer as a float
(10.0).class    # this is a Float

d = 2 ** 3      # d equals two to the power of three.
```  
5.) Write code that sets variable b to the power two of a.  
```ruby
a = 8
b = a ** 2
```  
Strings and integeters  
```ruby
"1" + "5"            # this will return "15"  
"1".to_i + "5".to_f  # this will return 6.0
```
6.) Write code that asks a user for two inputs and then return the multiplication result  
```ruby
puts "Give me the first number"

number_one = gets.chomp.to_f

puts "Give me the second number"

number_two = gets.chomp.to_f

result = number_one * number_two

puts number_one + " multiplied by " + number_two + " equals " + result

# or

puts "The resulting multiplication is #{number_one * number_two}."
```  
**String interpolation**  
We can access variables inside strings using string interpolation. Here's an example.  
```ruby
first_name = "drew".capitalize
last_name = "ogryzek".capitalize
full_name = first_name + " " + last_name
puts "Full name is: #{full_name}."
```  
**Logical Operators**  
We can check the value of operators. In Ruby we have `true` and we have `false`. Try these out in irb  
```ruby
false
true
10 > 5
a = 10
if a > 10
  puts "Your number is more than 10"
else
  puts "Your number is not greater than 10"
end
```  
The or operator is `||` and the and operator is `&&`.  
```ruby
# The || operator: Returns true if either is true
false || false            # returns false
false || true             # returns true
true || true              # returns true
true || false             # returns true
(10 > 6) || (6 > 9)       # returns true
false || (9 > 9)          # returns false

# The && operator: Returns true is both are true
false && true             # returns false
false && false            # returns true
true && false             # returns false
true && true              # returns true

(1 > 5) && (6 > 4)        # returns false
(10 >= 10) || false       # returns true
(100 == 100) || false     # returns true
```  
**Flow Control**  
```ruby
puts "Please give us your name" 

name = gets.chomp

if name.length > 20 
  puts "Your name is very long, #{name}!"
elsif name.length > 15
  puts "Your name is long, #{name}!"
else
  puts "Your name is short, #{name}!"
end
```  
7.) Write a code that asks users for the year of their car and outputs future, new car, old car, or very old.  
```ruby
puts "Please enter the year of your car."

car_year = gets.chomp.to_i

if car_year > 2014
  puts "Your car is from the future"
elsif car_year > 2010
  puts "Your car is new"
elsif car_year > 2004
  puts "Your car is getting old"
else
  puts "Your car is super old"
end
```  
8.) Write code that asks a user for their grade on an exam and then rints: A, B, C, or F.  
```ruby
puts "What was your grade?"

grade = gets.chomp.to_f

if grade > 95
  puts "A"
elsif grade > 87
  puts "B"
elsif grade > 80
  puts "C"
else
  puts "F"
end

# a shorthand if you are doing the same thing for every operation
puts(if grade > 95
      "A"
    elsif grade > 87
      "B"
    elsif grade > 80
      "C"
    else
      "F"
    end)
```  
9.) Write a code that takes a string and if the string is longer than 10 characters it will upcase it, if it is greater than 20 characters, it will capitalize it. Otherwise, it will downcase it.  
```ruby
puts "Give me a string!"

my_string = gets.chomp

puts  if my_string.length > 20
        my_string.capitalize
      elsif my_string.length > 10
        my_string.upcase
      else
        my_string.downcase
      end
```
What if I want to check if something is not true?  
```ruby
if !(string.length > 10)          # equivalent to if (string.length <= 10)
  puts "Hello"
else
  puts "hey"
end

# alternatively, use 'unless'
unless string.length > 10)  
  puts "Hello"
else
  puts "hey"
end  
  
a = 10 
a == 10               # true
a != 10               # false
b = 64

b = 5 if a > 10       # we can use 'in line conditionals'
b = 5 unless a > 10   # now b is equal to 5

y = 6 if a > 10       # => nil
y = 6 unless a > 10   # => 6
```  
10.) Write a code that asks users for the year of their car and then prints: future, new, old or very old using inline conditionals and only unless.  
```ruby
puts "What is the year of your car?"

year = gets.chomp.to_i

puts "very old" unless year >= 1950
puts "old" unless year > 1980 || year < 1950
puts "new" unless year >= 2005 || year < 1980
puts "very new" unless year >= 2014 || year < 2005
puts "future" unless year < 2014
```  
**Loops**  
When do we use loops in computing? We use loops when we want to execute some code x number of times. Ruby gives us a bunch of ways to do loops. Let's look at the first one, which is the while loop.  
  
The while loop takes a condition, and as long as that condition is true, it continues looping.  
```ruby
# while loops
x = 1
while x < 10
  puts "Hello CodeCore"
  x += 1
end

x = 10
x += 3          # this will increment x by 3
x -= 5          # this will decrement x by 5
x *= 4          # this will multiply x by 4
x /= 4          # this will divide x by 4


# if we change the increment value to 2, it will execute half the number of times.
x = 1
while x < 10
  puts "Hello CodeCore"
  x += 2
end
```  
10.) Print numbers 1 to 50 using a while loop.  
```ruby  
x = 1
while x <= 50 
  puts x
  x += 1
end
```  
11.) Print 50 to 1 using a while loop.  
```ruby
x = 50
while x >= 1
  puts x
  x -= 1
end
```  
12.) Write code that asks the user for a number, then prints "Hello world" that number of times.  
```ruby
puts "Please enter a number."

number = gets.chomp.to_i

while number >= 1
  puts "Hello world"
  number -= 1
end
```  
**Until**  
Until is the opposite of while. Until a condition is met, it will keep executing the same thing.  
```ruby
x = 1
until x > 10
  puts x
  x += 1
end
```  
13.) Write a code that asks a user for a number, and then prints the multiplication results for that number with 1 to 10 using an until loop.  
```ruby
puts "Please enter a number"

number = gets.chomp.to_i

x = 1
until x == number + 1
  puts "#{x}.) #{number * x}"
end

```  
14.) Print the first 30 odd numbers using an until loop.  
```ruby
x = 1
y = 1
until x > 30
  puts "#{x}.) #{y})"
  x += 1
  y += 2
end

# note there are built in methods in ruby for even? and odd?
5.even?         # => false
5.odd?          # => true

# The modulo operator returns the remainder
5 % 2           # => 1
5 % 11          # => 5
9 % 3           # => 0 

a = 2
9 % a == 0      # => false

a = 3
9 % a == 0      # => true
```  
**the for loop**  
```ruby
# take x, make it go from 1 to 13, and print x each time.
for x in 1..13            # this is called a range 1..13 (one to thirteen)
  puts x
end

# we can do a double dot, or a triple dot range.
for x in 1...13           # triple dot doesn't include the last number
  puts x
end

# we can add if else within a for loop
for x in 1...13
  if x == 5
    puts "HHHHH"
  else
    puts 12 - x
  end
end
```  
15.) Write code that asks the user for a humber, and then prints the numbers from that number to 100 if the number is less than 100.  
```ruby
puts "Please, enter a number."

number = gets.chomp.to_i

unless number > 100
  for x in number..100
    puts number
  end
end
```  
16.) FizzBuzz: Write a code that prints 1 to 100, and if the code is divisible by three, print 'Fizz", and if it's divisible by five, print "Buzz". If it is divisible by three and five, print "FizzBuzz."  
```ruby
for x in 1..100
  if x % 15 == 0
    puts "FizzBuzz"
  elsif x % 5 == 0
    puts "Buzz"
  elsif x % 3 == 0
    puts "Fizz"
  else
    puts x
  end
end

# Alternative style
for x in 1..100
  results = ""
  results += "Fizz" if x % 3 == 0
  results += "Buzz" if x % 5 == 0
  puts results == "" ? x : results
end
```  
***Blocks***
```ruby
7.times { puts "Hello CodeCore" }

# alternative syntax
7.times do
  puts "Hello CodeCore"
end


1.upto(7) { puts "Hello CodeCore" }

1.upto(100) do |x|
  puts x
end

14.downto(1) {|x| puts x}

44.downto(4) do |x|
  puts x
end
```  
17.) Ask the user for two numbers and then display the numbers from the lower number to the higher one. **stretch**: Display "Hello World" instead of the number if it's divisible by 7  
```ruby
puts "Please input a number."

number_one = gets.chomp.to_i

puts "Please input another number."

number_two = gets.chomp.to_i

if number_one > number_two
  number_two.upto(number_one) { |x| puts x % 7 == 0 ? "Hello World" : x }
elsif number_one < number_two
  number_one.upto(number_two) { |x| puts x % 7 == 0 ? "Hello World" : x }
end
```  
**The Ternary Operator**
```ruby
(a > 10) ? puts "yes" : puts "no"

# this is the same
if (a > 10)
  puts "yes"
else
  puts "no"
end
```
18.) Rewrite number 17 but set the start and finish variables using the ternary operator.  
```ruby
puts "Please input a number."
number_1 = gets.chomp.to_i
puts "Please input another number."
number_2 = gets.chomp.to_i

start = number_1 < number_2 ? number_1 : number_2
finish = number_1 < number_2 ? number_2 : number_1
start.upto(finish) { |n| puts n % 7 == 0 ? "Hello World" : n }
```  
**The Case Statement**  
```ruby
puts "Hello there! Enter a language: "
language = gets.chomp

# Add your case statement below!
case language
when "English" then puts "Hello"
when "French" then puts "Bonjour!"
when "Spanish" then puts "Hola!"
else puts "What was that?"
end
```
19.) Print all the keys in the hash below and all the members of the value arrays. For example: BC: Vancouver, Richmond
```ruby
students = {"bc" => ["vancouver", "richmond"], "ab" => ["edmonton", "calgary"] }

students.each_pair {|k,v| puts "#{k}: #{v.join(', ')}"}


```