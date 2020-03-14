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


end
