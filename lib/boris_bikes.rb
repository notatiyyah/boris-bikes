class DockingStation

  attr_reader :docked_bikes

  def initialize(num_of_bikes=0)
    @docked_bikes = []
    @capacity = 1
    num_of_bikes.times {@docked_bikes << Bike.new}
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
