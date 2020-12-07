class DockingStation 
  def initialize
    @docked_bikes = []

  end

  def release_a_bike
    Bike.new
  end

  def dock_bike(bike)
    @docked_bikes.push(bike)
  end
  
  attr_reader :docked_bikes
end

class Bike 
  def working?
    return true
  end

end
