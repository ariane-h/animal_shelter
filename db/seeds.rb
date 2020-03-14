require('pry-byebug')

require_relative('../models/owner.rb')
# require_relative('../models/dog.rb')


owner2 = Owner.new({
  'name' => 'Daisy Steiner',
  'email' => 'daisy@gmail.com',
  'phone' => '01234568',
  'has_cats' => false,
  'has_other_dogs' => false,
  'has_children' => false,
  'bio' => 'Daisy is looking for a cute fluffy dog.'})

owner2.save

binding.pry
nil
#
