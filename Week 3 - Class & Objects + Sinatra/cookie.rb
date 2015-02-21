class Cookie

  def initialize(sugar_amount, flour_amount)
    @sugar_amount = sugar_amount
    @flour_amount = flour_amount
    puts "Creating cookie with 
            #{sugar_amount}g of sugar and
            #{flour_amount}g of flour"
  end

  attr_reader :sugar_amount
  # def sugar_amount
  #   @sugar_amount
  # end

  attr_reader :flour_amount
  # def flour_amount
  #   @flour_amount
  # end

  attr_writer :sugar_amount
  # def sugar_amount=(new_amount)
  #   @sugar_amount = new_amount
  # end

  attr_writer :flour_amount
  # def flour_amount=(new_amount)
  #   @flour_amount = new_amount 
  # end

  attr_accessor :chip_count
  # attr_reader :chip_count
  # attr_writer :chip_count

  def info
    puts "This cookie has 
            #{@sugar_amount}g of sugar and
            #{@flour_amount}g of flour"
  end

  def eat
    a = "Hello World"
    puts "The Cookie is being eaten!"
  end

  def dip_in_milk
    puts "Dipping the Cookie in milk."
  end

  def bake_and_eat
    bake
    eat
  end

  private

  def bake
    puts "The Cookie is baking!"
  end

end
