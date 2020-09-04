require 'Docking_Station'

describe DockingStation do
  describe 'release_bike' do
    it { is_expected.to respond_to :release_bike }

    it 'releases a working bike when at least 1 bike present' do
      # docks a bike so station is not empty
      subject.dock(Bike.new)
      expect(subject.release_bike).to be_a Bike
    end

    it 'raises error when releasing bike when none present' do
      expect{ subject.release_bike }.to raise_error("No bike present")
    end
  end

  it 'docks bikes' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'stores docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.docked_bikes).to eq [bike]
  end



end
