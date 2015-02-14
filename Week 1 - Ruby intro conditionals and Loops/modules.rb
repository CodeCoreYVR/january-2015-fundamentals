module CalorieCalculator
  def calculate_calories(ingredients)
    total_calories = 0
    ingredients.each do |ingredient|
      if ingredient.respond_to?(:calorie_count)
        total_calories += ingredient.calorie_count
      else
        raise TypeError, "The ingredient must have a calorie_count"
      end      
    end
    total_calories
  end
end

food = Food.new("asdf")

food.calculate_calories












class Ingredient 
  attr_reader :name, :calorie_count
  def initialize(name, calorie_count = 0)
    @name           = name
    @calorie_count = calorie_count
  end
end

class Cookie < Food
  attr_reader :ingredients
  include CalorieCalculator
  def initialize(ingredients = [])
    @ingredients = ingredients
  end
end

class Tempura 
  attr_reader :ingredients
  include CalorieCalculator
  def initialize(ingredients = [])
    @ingredients = ingredients
  end
end