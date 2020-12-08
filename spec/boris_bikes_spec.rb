require "boris_bikes.rb"

describe DockingStation do

  it "contains release_bike method" do
    docking_station = DockingStation.new
    expect(docking_station).to respond_to(:release_bike)
  end
  
  it "can release a bike" do
    docking_station = DockingStation.new
    docking_station.set_num_of_bikes(1)
    bike = docking_station.release_bike
    expect(bike).to respond_to(:working?)
  end

  it "contains dock_bike method" do
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

  it "raises an error if asked to release a bike where there are none" do
    docking_station = DockingStation.new
    expect { docking_station.release_bike }.to raise_error("There are no bikes to release")
  end

  it "raises an error if asked to dock a bike where there is no space" do
    docking_station = DockingStation.new
    docking_station.set_num_of_bikes(20)
    # Fills docking station to max capacity
    bike = Bike.new
    expect { docking_station.dock_bike(bike) }.to raise_error("There is no space in this docking station")
  end

end

describe Bike do
  it "returns working? status" do
    bike = Bike.new
    expect(bike).to respond_to(:working?)
  end
end

