class DockingStation
  @@docked_bikes = []
  puts @@docked_bikes.length
    def release_bike
      if @@docked_bikes.length == 0
        fail "No bike present"
      end
      Bike.new
    end

    def dock(bike)
      @@docked_bikes << bike
    end
    attr_reader :docked_bikes
end


class Bike
  def working?
    return true
  end
end
