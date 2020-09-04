class DockingStation
  attr_reader :docked_bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @docked_bikes = []
  end

  def release_bike
    if empty?
      fail "No bike present"
    end

    if @docked_bikes.none? { |bike| bike[:working] == true }
      fail "No working bikes"
    end

    released_bike = @docked_bikes.pop
    released_bike[:bike]
  end

  def dock(bike, working = true)
    if full?
      fail "Dock is full"
    end
    @docked_bikes << { bike: bike, working: working }
  end

  private

  def full?
  @docked_bikes.length == @capacity
  end

  def empty?
    @docked_bikes.empty?
  end

end


class Bike
  def working?
    return true
  end
end
