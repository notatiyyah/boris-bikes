require "boris_bikes.rb"

describe DockingStation do

  it { is_expected.to respond_to :release_bike }
  
  it "can release a bike" do
    subject.set_num_of_bikes(1)
    bike = subject.release_bike
    expect(bike).to respond_to(:working?)
  end

  it { is_expected.to respond_to :dock_bike }

  it "can dock a bike" do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.docked_bikes.length).to eq 1
  end

  it "raises an error if asked to release a bike where there are none" do
    # Didn't add any bikes so empty docking station
    expect { subject.release_bike }.to raise_error("There are no bikes to release")
  end

  it "raises an error if asked to dock a bike where there is no space" do
    subject.set_num_of_bikes(subject.capacity)
    # Fills docking station to max capacity
    bike = Bike.new
    expect { subject.dock_bike(bike) }.to raise_error("There is no space in this docking station")
  end

  it "has a default capacity of 20" do
    subject.set_num_of_bikes(subject.capacity)
    # Fill docking station to max capacity
    expect(subject.docked_bikes.length).to eq 20
  end

  it "lets the user set the capacity to 30" do
    subject.set_capacity(30)
    subject.set_num_of_bikes(subject.capacity)
    # Fill docking station to max capacity
    expect(subject.docked_bikes.length).to eq 30
  end

  it "when docking the bike, lets the user report that it is not working" do
    bike = Bike.new
    subject.dock_bike(bike, false)
    docked_bike = subject.docked_bikes.pop
    expect(docked_bike.working?).to eq false
  end

end

describe Bike do

  it { is_expected.to respond_to :working? }

  it { is_expected.to respond_to :set_working_status }

  it "can update 'working' status" do
    subject.set_working_status(false)
    expect(subject.working?).to eq false
  end

end

