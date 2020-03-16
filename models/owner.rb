require_relative('../db/sql_runner')
require('pry-byebug')

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

  def dogs
    sql = "SELECT dogs.* from dogs
           INNER JOIN owners ON dogs.owner_id = owners.id
           WHERE owners.id = $1"
    values = [@id]
    dogs = SqlRunner.run(sql, values)
    result = dogs.map { |dog| Dog.new(dog) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [id]
    owner = SqlRunner.run(sql, values)
    result = Owner.new(owner.first)
    return result
  end

  def self.no_owner
    sql = "SELECT * FROM owners
          WHERE owners.name = 'no owner'"
    no_owner = SqlRunner.run(sql).first
    return no_owner
  end

  def self.valid_owners
    sql = "SELECT * FROM owners WHERE owners.name != 'no owner'"
    valid_owners = SqlRunner.run(sql)
    result = valid_owners.map { |owner| Owner.new(owner) }
    return result
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
