# Data Structures  
[arrays](http://www.ruby-doc.org/core-2.1.1/Array.html) | [hashes](http://www.ruby-doc.org/core-2.1.1/Hash.html)  
  
The main data structures in Rails are Arrays and Hashes. An array is basically an ordered list of objects.  
```ruby
a = [1, 59, "hey", "Yo", 200]
a[2]                            # => "Hey"
```
To access values in an array, we use square brackets and the index the value is at, starting from zero. The above array has 5 values, so indexes as follows  
```
a[0]              # 1
a[1]              # 59
a[2]              # "hey"
a[3]              # "Yo"
a[4]              # 200
```
1.) Write an array that contains three strings and three numbers. **stretch**: Add false, true and nil to the elements in the array.  
```ruby
my_array = ["Ruby", "Html", "css"]
my_array[1]       # "Html"

my_array = ["Ruby", "Html", "css", true, false, nil]
```  
To add syntax highlighting, you can add the following to your irbrc dot file. Dot files are hidden files on your 'nix system, and are generally used for configuration settings. This one is located in the home directory, which can be accessed in the terminal through tilde `cd ~` will change the directory to your home directory.  
  
If you have sublime setup through your terminal, you can use your shortcut to open files and open up the irbrc file `sublime ~/.irbrc`  
  
This should open up a file. You can add the following  
```ruby
# ruby 1.8.7 compatible
require 'rubygems'
require 'irb/completion'
 
# interactive editor: use vim from within irb
begin
  require 'interactive_editor'
rescue LoadError => err
  warn "Couldn't load interactive_editor: #{err}"
end
 
# awesome print
begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError => err
  warn "Couldn't load awesome_print: #{err}"
end
 
# configure irb
#IRB.conf[:PROMPT_MODE] = :SIMPLE
 
begin
  require 'hirb'
  Hirb.enable
rescue LoadError => err
  warn "Couldn't load hirb: #{err}"
end
 
# irb history
IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = File::expand_path("~/.irbhistory")
 
# load .railsrc in rails environments
railsrc_path = File.expand_path('~/.irbrc_rails')
if ( ENV['RAILS_ENV'] || defined? Rails ) && File.exist?( railsrc_path )
  begin
    load railsrc_path
  rescue Exception
    warn "Could not load: #{ railsrc_path } because of #{$!.message}"
  end
end
 
class Object
  def interesting_methods
    case self.class
    when Class
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end
end
 
module Kernel
  def require_relative(file)
    $:.unshift Dir.pwd
    require file
  end
 
  def guid(s)
    s.scan(/[a-f0-9-]{36}/).first
  end
end
```
You will then need to install a couple of gems.
```bash
gem install hirb
gem install awesome_print
```  
Arrays can include any object, including other arrays.  
```ruby
a = [[1,2,3], true, "Hey", "Aswin"]
a[1]                      # true
a[0][2]                   # 3
```  
### Multi-Dimensional Arrays  
```ruby
[[1,2,3], [1,2,3], [1,2,3], [1,2,3]]

a = [[1,5,3], [1,2,3,5], [0,2,3]]
a[2]                      # [0,2,3]
```
To push an element into the end of the array, we can use double less than `<<` (the push operator in Ruby).  
```ruby
a = [[1,5,3], [1,2,3,5], [0,2,3]]
a << true
=> a = [[1,5,3], [1,2,3,5], [0,2,3], true]
a[2] = "hey"
=> a = [[1,5,3], [1,2,3,5], "hey", true]
a.push "arrays"
=> a = [[1,5,3], [1,2,3,5], "hey", true, "arrays"]
```  
We can use `.include?` to see if an arrays contains an element. This method returns true or false. Generally, in Ruby methods that have a question mark at the end of them return true or false.  
```ruby
a.include? "aaa"
=> false

a.include? "hey"
=> true

a.include? "ey"
=> false

a.include? 1
=> false

a.include? [1,5,3]
=> true
```  
We don't have to remember all the [array methods](http://www.ruby-doc.org/core-2.1.1/Array.html), because we can check the ruby docs.  
  
2.) Find out how to get the number of Array elements in two different ways. ***stretch***: Find a method to turn multi-dimensional array into one-dimensional.  
```ruby
# find the number of elements in an array
a.count
a.length
a.size  

# Turn a multi-dimentional array into a one dimensional array
a.flatten!
```
3.) Find out how to convert a string sentence to an array of words.  
"Hello CodeCore Students" should become ["Hello", "CodeCore", "Students"].  
```ruby
a.split
```  
4.) FizzBuzz: Write code that adds 1 to 100 to an array and if code is divisible by three then adds Fizz, if it's divisible by 5, adds Buzz, and if it's divisible by both it adds FizzBuzz. **stretch**: Have the user enter the words instead of "Fizz" and "Buzz".  
```ruby
fizz_buzz = []

for x in 1..100
  if x % 15 == 0
    fizz_buzz.push("FizzBuzz")
  elsif x % 5 == 0
    fizz_buzz.push("Buzz")
  elsif x % 3 == 0
    fizz_buzz << "Fizz"
  else
    fizz_buzz.push(x)
  end
end

puts fizz_buzz


# Alternative method

def fizz_buzz(a="Fizz", b="Buzz", num_1=5, num_2=3)
  arr = []
  100.times do |x|
    if x % (num_1 + num_2) == 0
      arr << a + b
    elsif x % num_2 == 0
      arr << b
    elsif x % num_1 == 0
      arr << a
    else
      arr << x
    end
  end
  arr
end
```  
Other ways to loop through an array  
```ruby
my_array = [1, 5, 6, 7]

my_array.each do |x|
  y = x * 2
  puts y
end
```  
Let's practice by making a ruby file, with an array.  
```ruby
# each.rb

my_array = [1, 4, 6, 7]

my_array.each do |element|
  result = element * 2 + 5
  puts element
end
```  
5.) Build an array that contains five names, then loop through the array, and print names capitalized. **Stretch**: Store the capitalized names into a different array.  
```ruby
# first part
names = ["jim", "john", "jenny", "drew", "tam"]

names.each do |name|
  puts name.capitalize
end

# stretch part
names = ["jim", "john", "jenny", "drew", "tam"]
capitalized_array = []

names.each do |name|
  puts name.capitalize
  capitalized_array << name.capitalize
end
```  
6.) Build an array that contains five numbers then loop through the array and print each number multiplied by itself.
```ruby
numbers = [1, 2, 3, 4, 5]

numbers.each do |number|
  puts number * number
end
```
7.) Write code that takes a sentnece and then prints that sentence with each word capitalized. 
```ruby
sentence = "hello codecore students"
cap_sentence = ""
sentence.split.each do |word|
  cap_sentence += word.capitalize + " "
end

# or

sentence = "hello codecore students"
cap_sentence = ""
sentence.split.each do |word|
  cap_sentence += word.capitalize + " "
end
```


8.) Write code that takes an array of names and capitalize each element in it, using [map](http://www.ruby-doc.org/core-2.1.1/Array.html#method-i-map). **stretch**: Make it capitalized and then reversed.
```ruby
names = ["jim", "john", "jenny", "drew", "tam"]
names.map(&:capitalize!)
# or
names.map {|x| x.capitalize!}
```  
## Hashes  
Hashes are basically a key, value storage using ruby. The structure of a hash is a "key" and "value" within curly braces. We use a hashrocket operator when we define these key => value pairs.  
```ruby
me = {"name" => "Tam", "place" => "Burnaby", "company" => "CodeCore" }

# Instantiating a hash
my_hash = {}
my_hash = Hash.new(0) 
my_hash = {}

# Access values inside a hash with square brackets.

personal_information = {"name" => "Tam", "place" => "Burnaby", "company" => "CodeCore" }
personal_information["name"]
=> "Tam"
personal_information["name"] = "Tammam"


# Define default values
my_hash = Hash.new("Unknown")
my_hash["name"] = "Tam"

my_hash["name"]
=> "Tam"

my_hash["city"]
=> "Unknown"
```  
9.) Write a hash that stores your personal information  
```ruby
personal_information = Hash.new("N/A")
personal_information["name"] = "drew"
personal_information["height"] = "183cm"
```
10.) Write a hash that stores three car brands as keys and one car model as values.  
```ruby
cars = {"ford" => "mustang", "toyota" => "corolla", "hyundai" => "sonata"}
```  
11.) Now find a method in the [documentation](http://www.ruby-doc.org/core-2.1.1/Hash.html#method-i-keys) that returns an array of the keys.
```ruby
cars.keys
```  
We can iterate through a hash, similarly to how we iterate through an array using `each`. With a hash though, we have the keys and the values
```ruby
my_hash = {"a" => "something", "b", "something else"}

my_hash.each do |key, value|
  puts "the key is: #{key}, and the value is: #{value}"
end
```
12.) Write a hash that contains three Canadian provinces as keys and their capitals as values, then loop through it and print each province and its capital.  
```ruby
provinces = {"british columbia" => "victoria", "ontario" => "toronto", "quebec" => "quebec"}

provinces.each do |province, capital|
  puts "The capital of #{province.capitalize} is #{capital.capitalize}."
end
```
13.) Write code that makes the following hash output the province and cities, for example BC: Vancouver, Victoria

```ruby
provinces_and_cities = {"bc" => "vancouver, victoria", "ab" => "edmonton", "calgary"}

provinces_and_cities.each_pair {|k,v| puts "#{k.upcase}: #{v.join(', ').capitalize}"}

```
14.) Build an array that contains two hashes. Each hash should be personal information of a person (first name, last name, and age)
```ruby
personal_infos = [{"first_name" => "clair", "last_name" => "holt", "age" => "25"}, {"first_name" => "zooey", "last_name" => "deschanel", "age" => "34"}]

personal_infos[0]["last_name"]

{"city" => "vancouver", "population" => 400000}["population"]
```  
15.) Find the most recurring letter in a string.
```ruby
my_sentence = "as fas fads fasd asdf asd fadsafasd"

letter_frequency = {}

array_of_letters = my_sentence.gsub(" ", "").split("")

array_of_letters.each do |letter|
  letter_frequency[letter] += 1
end

letter_frequency.max_by {|k, v| v}[0]


# alternative method 

# "aaabcdef" 
# => "a"
map = Hash.new(0)

my_string = "aaabcdef"
letter_array = my_string.split('')
letter_array.length.times do |i|
  map[letter_array[i]] = letter_array.count(letter_array[i])
end

map.max_by {|k, v| v}[0]
```
## Methods  
We can define out own methods in ruby with `def`. Here's an example of a multiply method which has a couple of arguments 'a', and 'b'. Then we're going to 
```ruby
def multiply(a, b)
  a * b
end
```
16.) Write a method that takes two arguments and returns the sum of the two numbers.  
```ruby
def sum(a, b)
  a + b
end
```
17.) Write a method that takes one argument as name and then greets that name.
```ruby
greeting("codecore")
=> Hello CodeCore!

def greeting(greet)
  puts "Hello #{greet.capitalize}!"
end
```
18.) Write a method that takes two arguments and prints the results of the first to the power of the second.
```ruby
power_it(2,3)
=> 8

def power_it(a, b)
  a ** b
end
```
19.) Write a method that takes one argument and then prints whether the passed argyment is a String, Integer, or Array. Otherwise, it prints "something else".  
```ruby

def class_check(arg)
  puts(if arg.is_a? String
        "String"
      elsif arg.is_a? Integer
        "Integer"
      elsif arg.is_a? Array
        "Array"
      else
        "Something else"
      end)
end
```
Every method returns something. By default, if you don't include any return word, Ruby will return the last statement in the method. That means if we do something like multiply a and b, and then add a and b, we will return the sum.
```ruby
def sum(a, b)
  a * b
  a + b
end
```
Similarly, if we explicitely state a return, the method will return there, and not continue executing.  
```ruby
def sum(a, b)
  return a + b
  a * b
end
```
20.) Write a method called by_five? that takes a single number parameter and returns true if that number is evenly divisible by five, and false if not. Don't use return in this case.
```ruby
def by_five?(num)
  num % 5 == 0 ? true : false
end
```
## Variable Arguments  
Ruby enables you to be able to take as many arguments as you want by using an asterisk. 
```ruby
def multiply(a, *b)
  result = a
  b.each {|x| result *= x}
  result
end

multiply(4, 5, 5, 4, 5)
multiply(10, 4, 4)
```  
21.) Write a method that takes a variable number of numbers and returns a sum of all these numbers.  
```ruby
def sum_of_all(*args)
  sum = 0
  args.each {|arg| sum += arg}
  sum
end

# or 

def sum_of_all(*args)
  args.inject("+")
end
```  
## Blocks  
You can think of a block as a piece of code with no name.  
```ruby
# blocks
10.times do
  puts "hey guys"
end

10.times {puts "hey guys"}

# Sometimes a block takes one or more arguments

my_array = [1, 2, 3, 4, 5]

my_array.each do |x|
  puts "I'm now at #{x}"
end

my_array.each {|x| puts "I'm not at #{x}"}
```
## Symbols
Symbols are a special kind of object in Ruby. Usually when we create a symbol we do so by starting with a colon. 
```ruby
:this_is_a_symbol
```  
Symbols are immutable, and they take the same spot in memory. This means that once you create a symbol, you cannot change the value of it. 
```ruby
a = :abc
b = :abc
c = "abc"
d = "abc"

a.object_id
=> 719528
b.object_id
=> 719528
c.object_id
=> 2178883500
d.object_id
=> 2178866080
```  
The downside of symbols is they are not easily garbage collected. There should be a way to continuously clean up memory as you use a program. Ruby does this automatically for us using a process called garbage collection.  
  
With symbols, it has to be very careful, because there could be multiple things pointing at the same values. There are a few cases where we use symbols, and for now, we'll stick to those. Later on, you'll have a better sense of when it's appropriate to use a symbol and when not.  
  
We usually use symbols for hash keys, rather than strings, because it's much more efficient and faster.  
```ruby
{:name => "drew" :city => "vancouver"}
my_hash = _
my_hash[:name]
=> "drew"
```
Because it is so common to use symbols as hash keys, from Ruby 1.9, we have a shorthand for this where we can use a colon instead of the hash rocket.
```
{name: "drew", city: "vancouver"}
```
22.) Write a hash that stores your personal information using symbols in a hash.  
```ruby
personal_info = {name: "drew", city: "vancouver", occupation: "CodeCore"}
```
We can convert strings to symbols and symbols to strings.
```ruby
"hello".to_sym
=> :hello

:my_symbol.to_s
=> "my_symbol"

```
Note that symbols use snake case, so we use an underscore in place of a space.  
  
23.) Write a method that takes an array and returns a hash whose keys are symbols from the array and the value is the character count.  
```ruby
greetings = ["hello", "greetings", "hola", "hi"]

def arr_count(arr)
  char_count = {}
  arr.each {|item| char_count[item.to_sym] = item.length}
  char_count
end

arr_count(greetings)
```
24.) Write a method that takes a hash of city populations, and prints if the city is large (more than 100,000) or small otherwise. Printing something like "Vancouver is a large city."
```ruby
bc_cities_population = { vancouver: 2135201, victoria: 316327, abbotsford: 149855, kelowna: 141767, nanaimo: 88799, white_rock: 82368, kamloops: 73472, chilliwack: 66382 }

def large_or_small(cities)
  cities.each do |k, v| 
    if v > 100000
      puts "#{k} is a large city"
    elsif v <= 100000
      puts "#{k} is a small city"
    else
      puts "I don't know the population of #{k}"
    end
  end
end

large_or_small(bc_cities_population)
```  
