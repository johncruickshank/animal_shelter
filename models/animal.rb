require_relative("../db/sql_runner")

class Animal
  attr_reader :id, :name, :type, :breed, :adoptable, :admission_date, :image

  def initialize(options)
    @id = options['id'].to_i()
    @name = options['name']
    @type = options['type']
    @breed = options['breed']
    @adoptable = options['adoptable']
    @admission_date = options['admission_date']
    @image = options['image']
  end

  def save()
    sql = "INSERT INTO animals
    (
      name, type, breed, adoptable, admission_date, image
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @type, @breed, @adoptable, @admission_date, @image]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM animals ORDER BY type"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map { |animal| Animal.new(animal) }
  end

  def self.find(id)
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values).first()
    return Animal.new(results)
  end

  def self.delete_all
    sql = "DELETE FROM animals"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.destroy(id)
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def owners()
    sql = "SELECT owners.* FROM owners INNER JOIN pets ON pets.animal_id = owners.id WHERE animal_id = $1"
    values = [@id]
    owners = SqlRunner.run(sql, values)
    return owners.map { |owner| Owner.new(owner)}
  end

  def update()
    sql = "UPDATE animals
    SET
    (
      name, type, breed, adoptable, admission_date, image) =
    ($1, $2, $3, $4, $5, $6)
    WHERE id = $7"
    values = [@name, @type, @breed, @adoptable, @admission_date, @image, @id]
    SqlRunner.run(sql, values)
  end

end
