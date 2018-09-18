require('minitest/autorun')
require('minitest/rg')
require_relative('../person')

class TestPerson < MiniTest::Test

  def setup
    @person1 = Person.new("Simon", 27)
    @person2 = Person.new("Emily", 36)
    @person3 = Person.new("Nathan", 88)
  end

  def test_person_name
    assert_equal("Simon", @person1.name)
  end

end
