require 'Docking_Station'

describe DockingStation do
  describe 'release_bike' do
    it { is_expected.to respond_to :release_bike }

    it 'releases a working bike when at least 1 bike present' do
      # docks a bike so station is not empty
      subject.dock(Bike.new)
      expect(subject.release_bike).to be_a Bike
    end

    it 'raise error when trying to release bike but all broken' do
      subject.dock(Bike.new, false)
      expect{ subject.release_bike }.to raise_error("No working bikes")
    end

    it 'raises error when releasing bike when none present' do
      expect{ subject.release_bike }.to raise_error("No bike present")
    end

    it 'removes bike from docking station' do
      subject.dock(Bike.new)
      subject.release_bike
      expect(subject.docked_bikes).to be_empty
    end
  end

  describe 'dock' do
    it 'docks bikes' do
     bike = Bike.new
     expect(subject.dock(bike)).to eq [{ bike: bike, working: true }]
    end

    it 'allows docking of broken bikes' do
      bike = Bike.new
      expect(subject.dock(bike, false)). to eq [{ bike: bike, working: false }]
    end

    it "raises an error when trying to dock a bike to a full docking station with default capacity" do
      (subject.capacity).times { subject.dock(Bike.new) }
      expect{ subject.dock(Bike.new) }.to raise_error("Dock is full")
    end

    it "raises an error when trying to dock a bike to a full station with capacity set to 10" do
      docking_station = DockingStation.new(10)
      (docking_station.capacity).times { docking_station.dock(Bike.new) }
      expect{ docking_station.dock(Bike.new) }.to raise_error("Dock is full")
    end
  end

  it 'stores docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.docked_bikes).to eq [{ bike: bike, working: true }]
  end
end
