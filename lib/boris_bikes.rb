class DockingStation

  attr_reader :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
    Bike.new
  end

  def dock_bike(bike)
    @docked_bikes.push(bike)
  end

end

class Bike 
  
  def working?
    return true
  end

end
