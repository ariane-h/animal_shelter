require_relative('../db/sql_runner')

class Owner

attr_accessor :name, :email, :phone, :has_cats, :has_other_dogs, :has_children, :bio
attr_reader :id

  def initialize ( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @email = options['email']
    @phone = options['phone']
    @has_cats = options['has_cats']
    @has_other_dogs = options['has_other_dogs']
    @has_children = options['has_children']
    @bio = options['bio']
  end

  def save
    sql = "INSERT INTO owners
          (
            name,
            email,
            phone,
            has_cats,
            has_other_dogs,
            has_children,
            bio
          )
          VALUES
          ($1, $2, $3, $4, $5, $6, $7)
          RETURNING id"
    values = [@name, @email, @phone, @has_cats, @has_other_dogs, @has_children, @bio]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end


  def update
    sql = "UPDATE owners SET
          (
            name,
            email,
            phone,
            has_cats,
            has_other_dogs,
            has_children,
            bio
          ) = ($1, $2, $3, $4, $5, $6, $7)
          WHERE id = $8"
    values = [@name, @email, @phone, @has_cats, @has_other_dogs, @has_children, @bio, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM owners WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def self.all
    sql = "SELECT * FROM owners"
    owners = SqlRunner.run(sql)
    result = owners.map {|owner| Owner.new(owner)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM owners"
    SqlRunner.run(sql)
  end


end
