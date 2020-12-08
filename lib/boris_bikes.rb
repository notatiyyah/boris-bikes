class DockingStation

  attr_reader :docked_bikes

  def initialize
    @docked_bikes = []
    @capacity = 20
  end

  def set_num_of_bikes(num)
    if num > @capacity
      num = @capacity
      puts "You tried to enter more bikes than can fit, #{@capacity} bikes have been added"
    end
    num.times {@docked_bikes << Bike.new}
  end

  def release_bike
    bike = @docked_bikes.pop
    if bike.nil?
      raise "There are no bikes to release"
    else
      return bike
    end
  end

  def dock_bike(bike)
    if @docked_bikes.length >= @capacity
      raise "There is no space in this docking station"
    else
      @docked_bikes.push(bike)
    end
  end

end

class Bike 
  
  def working?
    return true
  end

end
