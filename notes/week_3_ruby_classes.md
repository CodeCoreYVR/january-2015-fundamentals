# Ruby: Classes  
Let's make a new class called cookie.  
```ruby
# cookie.rb
class Cookie

end
```  
If we want to load and access this class in irb, and then instantiate some cookie objects, we can do so by loading the file.  
```irb
load 'cookie.rb'
cookie = Cookie.new
```
We use capitals for class names in Ruby by [convention](https://github.com/styleguide/ruby).  
1.) Build two classes: Car and British Columbia  
```ruby
# car.rb
class Car
end

# british_columbia.rb
class BritishColumbia

end
```  
Now that we can make objects, let's look at adding methods.
```ruby
# cookie.rb
class Cookie
  def bake
    puts "Baking..."
  end
  def eat
    puts "Eating..."
  end
end
```
Now in irb, we can instantiate a new cookie object, and call methods on it.  
```ruby
load 'cookie.rb'
cookie = Cookie.new
cookie.bake
cookie.eat
```
In Ruby we have private methods and public methods. If we add the word public to our class, then all methods below that word will be private. Let's see what that means.  
```ruby
# cookie.rb
class Cookie
  def bake
    puts eat
    puts "Baking..."
  end
  
  private
  
  def eat
    puts "Eating..."
  end
end
```
Then try calling that method on a cookie object in irb.  
```ruby
irb
cookie = Cookie.new
cookie.eat
NoMethodError: private method `eat' called for #<Cookie:0x00000102baa560>
```
2.) Add 3 public methods to your car: drive, stop, and park that just print text.
```ruby
# car.rb
class Car

  def drive
    puts "driving..."
  end
  
  def stop
    puts "stopping..."
  end
  
  def park
    puts "parking..."
  end

end
```
3.) Add private methods to your car called pump gas and ignite engine.  
```ruby
# car.rb
class Car

  def drive
    puts "driving..."
  end
  
  def stop
    puts "stopping..."
  end
  
  def park
    puts "parking..."
  end
  
  private
  
  def pump_gas
    puts "pumping gas..."
  end
  
  def ignite_engine
    puts "igniting engine..."
  end

end
```
4.) Call ignite engine before printing the drive method
```ruby
# car.rb
class Car

  def drive
    ignite_engine
    puts "driving..."
  end
  
  def stop
    puts "stopping..."
  end
  
  def park
    puts "parking..."
  end
  
  private
  
  def pump_gas
    puts "pumping gas..."
  end
  
  def ignite_engine
    puts "igniting engine..."
  end

end
```
5.) Build two car objects and call the public methods on them.  
```ruby
irb
car_one = Car.new
car_two = Car.new
car_one.drive
car_two.park
```
We can use 'class' methods if we want a class to be able to call them rather than instances of that class.
```
# cookie.rb
class Cookie

  self.who_are_you
    puts "I'm a Cookie class"
  end
  
end
```
Then create a cookie and call the class method on it. You'll notice it doesn't work. We can only call class methods on the class.
```irb
irb
load 'cookie.rb'
cookie = Cookie.new
cookie.who_are_you      # gives an error
Cookie.who_are_you
```
6.) Add a class method called 'max speed to your car class that returns 200
```ruby
# car.rb
class Car

  def drive
    ignite_engine
    puts "driving..."
  end
  
  def stop
    puts "stopping..."
  end
  
  def park
    puts "parking..."
  end
  
  def max_speed
    200
  end
  
  private
  
  def pump_gas
    puts "pumping gas..."
  end
  
  def ignite_engine
    puts "igniting engine..."
  end

end
```
In order to pass parameters to a class when we initialize an instance of it, we add an initialize method.  
```ruby
# cookie.rb
class Cookie

  def initialize(sugar_amount, flour_amount)
    @sugar_amount = sugar_amount
    @flour_amount = flour_amount
    puts "creating new object"
  end
  
  def bake
    puts "Baking cookie with #{@sugar_amount}g of sugar and #{@flour_amount}g of flour."
  end
  
  def eat
    puts "Eating..."
  end
end
```
7.) In your Car class add the following attributes to the initialize: model, type, and capacity as instance variables.
```ruby
# car.rb
class Car
  def initialize(model, type, capacity)
    @model = model
    @type = type
    @capacity = capacity
  end
  
  # ...
  
end
```
8.) Build a class computer that has the parameters: brand, memory, and cpu power.  
```ruby
# computer.rb
class Computer
  def initialize(brand, memory, cpu_power)
    @brand, @memory, @cpu_power = brand, memory, cpu_power
  end
end
```
9.) Add a method to your computer class to print all the computer specs.  
```ruby
# computer.rb
class Computer
  def initialize(brand, memory, cpu_power)
    @brand, @memory, @cpu_power = brand, memory, cpu_power
  end
  
  def specs
    puts "#{@brand} computer with #{@memory}gb of ram and #{@cpu_power}Ghz of processing power!"
  end
end
```
You can define a global variable in Ruby by putting a dollar sign in front of it. `$global_variable`. Generally, it is considered bad practice to use global variables in Ruby.  
  
A variable with a double at is called a class variable. These are accessed by all instances of that class, and use a double at sign `@@class_variable`.  
  
```ruby
# computer.rb
class Computer
  def initialize(brand, memory, cpu_power)
    @brand, @memory, @cpu_power = brand, memory, cpu_power
  end
  
  def specs
    puts "#{@brand} computer with #{@memory}gb of ram and #{@cpu_power}Ghz of processing power!"
  end
  
  def get_color
    @@color
  end
  
  def set_color(color)
    @@color = color
  end
  
end
```
**Note**: These have very rare use cases, as it is rare that every instance of a class should have the exact same property.  
  
Since we cannot just call class attributes, but sometimes we may wish to know them, a common practice would be to define a method with the name of that attribute, and have it return the attribute value. We can also define a setter method with an equals sign before the parameter.    
```ruby
# ...
  def brand
    @brand
  end
  
  def brand=(brand)
    @brand = brand
  end
# ...
```
If we add the above methods to our computer class, we can then call `.brand` on objects of the class Computer.
```ruby
pc = Computer.new("Dell", 8, 3)
pc.brand
```
Alternatively, we can pass a parameter into the brand method to set a new brand.
```ruby
pc.brand = "IBM"
```
Since this is such a common thing to do, Ruby has some methods we can use instead.
```ruby
# ...
  attr_reader :brand
  #def brand
  #  @brand
  #end
  
  attr_writer :brand
  #def brand=(brand)
  #  @brand = brand
  #end
  
  attr_accessor :brand
  #attr_reader :brand
  #attr_writer :brand
  
# ...
```
10.) Guild a class "Rectangle" and give it two attribute accessors: width and height. Adda  method "area" that returns the area.  
```ruby
class Rectangle
  attr_accessor :width, :height
  def initialize(width, height)
    @width, @height = width, height
  end
  
  def area
    width * height
  end
end
```
**note**: As a general rule of thumb, if you have a method and a variable of the same name, try to use the method to access it.  
  
11.) Design the rectangle class a little differently: Add an initialize method to the Rectangle that auto calculates the area. Make sure to have an attribue reader to access the results.  
```ruby
# rectangle.rb
class Rectangle
  attr_accessor :width, :height
  attr_reader :area
  def initialize(width, height)
    @width, @height = width, height
    @area = @width * @height
  end
  
#  def area
#    width * height
#  end
end
```

12.) Build a class User and give it two attribute accessors: first name and last name. Adda  method full name that returns the full name.  
```ruby
class User
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name, @last_name = first_name, last_name
  end


  def full_name
    "#{@first_name.capitalize} #{@last_name.capitalize}"
  end

end
```
13.) Look at the [slide 35](https://codecore.certified.in/codecore-fundamentals-april-2014-cohort/week-3-3/class-presentation-11), and try to figure out how to build the appropriate class to produce the same results.
```ruby
class TestAttrMethods
  attr_reader     :a
  attr_accessor   :b
  attr_writer     :c
  
  def initialize(a, b = "Hello!", c = "Bonjour!")
    @a, @b, @c = a, b, c
  end
  
  def greetings
    puts "#{a} #{b} #{@c}"
  end
end
```
Inheritance can allow us to do things like create an Oreo™ class which inherits all the methods our cookie class has.  
```ruby
# oreo.rb
class Oreo < Cookie


end
```
Then Oreo has all the behavior from Cookie. You can go further and override the method, for example, we can give oreo a different who are you method, and give a filling type attribue accessor that we can read and write.
```ruby
# oreo.rb
class Oreo < Cookie

  attr_accessor :filling_type
  
  def self.who_are_you
    puts "I am an Oreo class!"
  end

end
```
Then in irb, we can do
```irb
Oreo.who_are_you
oreo = Oreo.new(15, 5)
oreo.filling_type = 'cream'
```
We can use Modules to arrange our classes. This is mostly for categorization purposes. Imagine, for example if we want to have two classes named Apple. One for the fruit, and one for the computer. We can define them under separate modules.  
```ruby
module Fruit
  class Apple
    attr_accessor :name
    def initialize(name)
      @name = name
    end
  end
end

module Computer
  class Apple
    attr_accessor :name
    def initialize(name)
      @name = name
    end
  end
end
```
To call classes within a module, we use double colon.  
```bash
gala = Fruit::Apple.new("Gala")
imac = Computer::Apple.new("iMac")
```
This brings us to gems. We can install gems locally to our computers by just typing `gem install [gem-name]`.  
Let's get the [snooby gem](https://github.com/andkerosine/snooby)! `gem install snooby`. Then go into irb and `require 'snooby'`.  
Then we have access to some interesting methods this gem gives us. We can start by making a new connection to reddit.  
```bash
reddit = Snooby::Client.new
reddit.subreddit('askscience').posts[0].selftext
```
Let's try another gem called [colorize](https://github.com/fazibear/colorize)
```bash
gem install colorize
```
This allows us to change colors with some methods it gives us, if we require it while we're in irb.  
```irb
puts "This is blue".colorize(:blue)
puts "This is light blue with red background".colorize(:color => :light_blue, :background => :red)
```
## Sinatra
Sinatra is a gem that gives us web framework for Ruby. Let's install this gem `gem install sinatra`

