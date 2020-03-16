require_relative('../db/sql_runner')

class Dog

attr_accessor :name, :age, :gender, :size, :breed, :ok_w_cats, :ok_w_dogs, :ok_w_children, :bio, :image_name, :owner_id
attr_reader :id

  def initialize ( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @age = options['age'].to_i
    @gender = options['gender']
    @size = options['size']
    @breed = options['breed']
    @ok_w_cats = options['ok_w_cats']
    @ok_w_dogs = options['ok_w_dogs']
    @ok_w_children = options['ok_w_children']
    @bio = options['bio']
    @image_name = options['image_name']
    @owner_id = options['owner_id'].to_i
  end

  def save
    sql = "INSERT INTO dogs
          (
            name,
            age,
            gender,
            size,
            breed,
            ok_w_cats,
            ok_w_dogs,
            ok_w_children,
            bio,
            image_name,
            owner_id
          )
          VALUES
          (
            $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11
          )
          RETURNING id"
    values = [@name,@age,@gender,@size,@breed,@ok_w_cats,@ok_w_dogs,@ok_w_children,@bio,@image_name,@owner_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update
    sql = "UPDATE dogs SET
          (
            name,
            age,
            gender,
            size,
            breed,
            ok_w_cats,
            ok_w_dogs,
            ok_w_children,
            bio,
            image_name,
            owner_id
          ) = ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
          WHERE id = $12"
    values = [@name,@age,@gender,@size,@breed,@ok_w_cats,@ok_w_dogs,@ok_w_children,@bio,@image_name,@owner_id,@id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM dogs WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def owner
    sql = "SELECT owners.* from owners
           INNER JOIN dogs ON owners.id = dogs.owner_id
           WHERE dogs.id = $1"
    values = [@id]
    owner = SqlRunner.run(sql, values).first
    return owner
  end

  def assign_to_owner(owner_id)
    sql = "UPDATE dogs SET owner_id = $1
            WHERE dogs.id = $2"
    values = [owner_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.find( id )
    sql = "SELECT * FROM dogs WHERE id = $1"
    values = [id]
    dog = SqlRunner.run(sql, values)
    result = Dog.new(dog.first)
    return result
  end

  def self.all
    sql = "SELECT * FROM dogs"
    dogs = SqlRunner.run(sql)
    result = dogs.map {|dog| Dog.new(dog)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM dogs"
    SqlRunner.run(sql)
  end

end
