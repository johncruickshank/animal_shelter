require("minitest/autorun")
require("minitest/rg")
require_relative("../animal")
require_relative("../owner")
require_relative("../pet")
require_relative("../../db/seeds")
require_relative("../../db/sql_runner")

class TestAnimal < Minitest::Test

def test_owners()
  animal = animal1
  owner = owner1
  pet = pet1

  assert_equal("Jimmy", animal1.owners())
end





end
