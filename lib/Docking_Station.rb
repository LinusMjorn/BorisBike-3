class DockingStation
  attr_reader :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
    if @docked_bikes.length == 0
      fail "No bike present"
    end
    Bike.new
  end

  def dock(bike)
    if @docked_bikes.length == 20
      fail "Dock is full"
    end
    @docked_bikes << bike
  end
end


class Bike
  def working?
    return true
  end
end
