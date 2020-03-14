require_relative('../db/sql_runner')

class Dog

attr_accessor :name, :age, :gender, :size, :breed, :ok_w_cats, :ok_w_dogs, :ok_w_children, :bio, :owner_id
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
            owner_id
          )
          VALUES
          (
            $1, $2, $3, $4, $5, $6, $7, $8, $9, $10
          )
          RETURNING id"
    values = [@name,
              @age,
              @gender,
              @size,
              @breed,
              @ok_w_cats,
              @ok_w_dogs,
              @ok_w_children,
              @bio,
              @owner_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

end
