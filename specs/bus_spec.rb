require('minitest/autorun')
require('minitest/rg')
require_relative('../bus')
require_relative('../person')

class TestBus < MiniTest::Test

  def setup
    @person1 = Person.new("Simon", 27)
    @person2 = Person.new("Emily", 36)
    @person3 = Person.new("Nathan", 88)
    @bus1 = Bus.new(22,"Ocean Terminal", [])
  end

  def test_route_number
    assert_equal(22,@bus1.route)
  end

  def test_destination
    assert_equal("Ocean Terminal",@bus1.destination)
  end

  def test_drive
    assert_equal("Brum brum!",@bus1.drive())
  end

  def test_count_passengers
    assert_equal(0, @bus1.count_passengers)
  end

  def test_pick_up_passenger
    @bus1.pick_up_passenger(@person1)
    assert_equal(1, @bus1.count_passengers)
  end

  def test_find_by_name()
    @bus1.pick_up_passenger(@person2)
    result = @bus1.find_by_name("Emily")
    assert_equal(@bus1.passengers[0],result)
  end


  def test_drop_off
    @bus1.pick_up_passenger(@person2)
    @bus1.drop_off(@person2)
    assert_equal(0, @bus1.count_passengers)
  end

  def test_empty_bus
    @bus1.pick_up_passenger(@person1)
    @bus1.pick_up_passenger(@person2)
    @bus1.pick_up_passenger(@person3)
    assert_equal(3,@bus1.count_passengers)
    @bus1.empty_bus
    assert_equal(0,@bus1.count_passengers)
  end

end
