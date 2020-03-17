require('pry-byebug')

require_relative('../models/owner.rb')
require_relative('../models/dog.rb')

Dog.delete_all
Owner.delete_all

owner1 = Owner.new({
  'name' => 'no owner',
  'email' => 'na',
  'phone' => 'na',
  'has_cats' => false,
  'has_other_dogs' => false,
  'has_children' => false,
  'bio' => 'na'})

owner2 = Owner.new({
  'name' => 'Daisy Steiner',
  'email' => 'daisy@gmail.com',
  'phone' => '01234568',
  'has_cats' => false,
  'has_other_dogs' => false,
  'has_children' => false,
  'bio' => 'Daisy is looking for a cute fluffy dog.'})

  owner3 = Owner.new({
    'name' => 'Tim Bisley',
    'email' => 'phantom_menace@gmail.com',
    'phone' => '734939573',
    'has_cats' => true,
    'has_other_dogs' => true,
    'has_children' => false,
    'bio' => 'Tim is looking for an intimidating tiny dog.'})

owner1.save
owner2.save
owner3.save

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
  'image_name' => 'poppy',
  'owner_id' => owner1.id })

dog2 = Dog.new({
    'name' => 'Colin',
    'age' => 5,
    'gender' => 'male',
    'size' => 'small',
    'breed' => 'Miniature Schnauzer',
    'ok_w_cats' => false,
    'ok_w_dogs' => true,
    'ok_w_children' => true,
    'bio' => 'Hi, i am Colin',
    'image_name' => 'colin',
    'owner_id' => owner1.id })

dog3 = Dog.new({
    'name' => 'Charles',
    'age' => 5,
    'gender' => 'male',
    'size' => 'small',
    'breed' => 'Pug',
    'ok_w_cats' => false,
    'ok_w_dogs' => false,
    'ok_w_children' => false,
    'bio' => 'Hi, i am Charles',
    'image_name' => 'charles',
    'owner_id' => owner1.id })

dog1.save
dog2.save
dog3.save

matches =  owner2.match

binding.pry
nil
