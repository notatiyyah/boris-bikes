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
    if @docked_bikes.empty?
      raise "There are no bikes to release"
    else
      @docked_bikes.pop
    end
  end

  def full?
    return @docked_bikes.length >= @capacity
  end

  def dock_bike(bike)
    if full?
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
