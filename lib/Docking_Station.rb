class DockingStation
  attr_reader :docked_bikes

  def initialize
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
  @docked_bikes.length == 20
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
