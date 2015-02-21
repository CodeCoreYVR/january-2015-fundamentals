class Cat
  attr_accessor :name

  def initialize(name)
    @name  = name
    @birds = []
  end

  def catch(bird)
    @birds.unshift bird
  end

  def eat
    if @birds.count > 0
      puts "Eating the bird #{@birds.pop.name}"
    else
      puts "Please catch a bird first"
    end
  end

end
