class Bus

  attr_reader :route, :destination, :passengers

  def initialize(route,destination, passengers)
    @route = route
    @destination = destination
    @passengers = passengers
  end

  def drive
    return "Brum brum!"
  end

  def count_passengers()
    return @passengers.length
  end

  def pick_up_passenger(passenger)
    @passengers << passenger
  end

  def find_by_name(name)
    for person in @passengers
      if person.name == name
        return person
      end
    end
  end

  def drop_off(passenger)
    person = find_by_name(passenger.name)
    @passengers.delete(person)
    p @passengers
  end

  def empty_bus
    people = []
    for person in @passengers
      people << person
    end
    for person in people
      drop_off(person)
    end
  end






end
