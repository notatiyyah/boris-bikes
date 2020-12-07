require "boris_bikes.rb"

describe DockingStation do
 #it "is where the bike is stored" do
    
  # end

  it "understand what release a bike means" do
    docking_station = DockingStation.new
    expect(docking_station).to respond_to(:release_a_bike)
  end
  
  it "can release a bike" do
    docking_station = DockingStation.new
    bike = docking_station.release_a_bike
    expect(bike.working?) == true
  end

  it "knows how to dock a bike" do
    docking_station = DockingStation.new
    bike = Bike.new
    expect(docking_station).to respond_to(:dock_bike)

  end

  it "can dock a bike" do
    docking_station = DockingStation.new
    bike = Bike.new
    docking_station.dock_bike(bike)
    expect(docking_station.docked_bikes.length).to eq 1
  end

end

describe Bike do
  it "responds whether or not bike is working" do
    bike = Bike.new
    expect(bike).to respond_to(:working?)
  end
end

