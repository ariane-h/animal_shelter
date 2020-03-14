require('pry-byebug')

require_relative('../models/owner.rb')
require_relative('../models/dog.rb')


owner2 = Owner.new({
  'name' => 'Daisy Steiner',
  'email' => 'daisy@gmail.com',
  'phone' => '01234568',
  'has_cats' => false,
  'has_other_dogs' => false,
  'has_children' => false,
  'bio' => 'Daisy is looking for a cute fluffy dog.'})
owner2.save

dog1 = Dog.new({
  'name' => 'Poppy',
  'age' => 7,
  'gender' => 'female',
  'size' => 'medium',
  'breed' => 'Poodle',
  'ok_w_cats' => true,
  'ok_w_dogs' => true,
  'ok_w_children' => true,
  'bio' => 'My name is Poppy and I am the cutest',
  'owner_id' => owner2.id })
dog1.save

binding.pry
nil
#
