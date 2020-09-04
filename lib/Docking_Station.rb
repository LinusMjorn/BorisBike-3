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
    Bike.new
  end

  def dock(bike)
    if full?
      fail "Dock is full"
    end
    @docked_bikes << bike
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
