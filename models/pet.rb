require_relative("../db/sql_runner")

class Pet
  attr_reader :id, :owner_id, :animal_id

  def initialize(options)
    @id = options['id'].to_i()
    @owner_id = options['owner_id'].to_i()
    @animal_id = options['animal_id'].to_i()
  end

  def save()
    sql = "INSERT INTO pets
    (
      owner_id, animal_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@owner_id, @animal_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM pets"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map { |pet| Pet.new(pet) }
  end

  def self.find(id)
    sql = "SELECT * FROM pets
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values).first()
    return Pet.new(results)
  end

  def self.delete_all
    sql = "DELETE FROM pets"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.destroy(id)
    sql = "DELETE FROM pets
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def owner()
    sql = "SELECT * FROM owners WHERE owner_id = $1"
    values = [@owner_id]
    owner = SqlRunner.run(sql, values).first()
    return Owner.new(owner)
  end

  def animal()
    sql = "SELECT * FROM animals WHERE animal_id = $1"
    values = [@animal_id]
    animal = SqlRunner.run(sql, values).first()
    return Animal.new(animal)
  end

end
