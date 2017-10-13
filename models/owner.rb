require_relative("../db/sql_runner")

class Owner
  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i()
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO owners
    (
      name,
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM owners"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map { |owner| Owner.new(owner) }
  end

  def self.find(id)
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values).first()
    return Owner.new(results)
  end

  def self.delete_all
    sql = "DELETE FROM owners"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.destroy(id)
    sql = "DELETE FROM owners
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def animals()
    sql = "SELECT animals.* FROM animals INNER JOIN pets ON pets.owner_id = animals.id WHERE owner_id = $1"
    values = [@id]
    animals = SqlRunner.run(sql, values)
    return animals.map { |animal| Animal.new(animal)}    
  end

end
