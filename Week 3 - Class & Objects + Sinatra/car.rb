class Car

  def initialize(model, type, capacity)
    # @type, @model, @capacity = type, model, capacity
    @type = type
    @model = model
    @capacity = capacity
  end

  def info
    puts "Car with #{@type} type,
          capacity is #{@capacity}
          model is #{@model}"
  end

  def self.info
    details
    puts "This is a Car class"
  end

  def self.max_speed
    200
  end

  def drive(distance)
    ignite_engine
    puts "Drivings for #{distance}km"
  end

  def park
    puts "Parking..."
  end

  def stop
    puts "Stopping.."
  end

  private

  def self.details
    "details about the car"
  end

  def ignite_engine
    puts "Igniting engine..."
  end

  def pump_gas
    puts "Pumping gas..."
  end

end
